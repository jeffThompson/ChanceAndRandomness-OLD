
'''
BASIC GENERATORS
dev/random 			default
aes_ofb				crypto, created w dieharder
threefish			crypto, created w dieharder
dieharder:xxx		various options w dieharder (see below)
congruential		not very secure but classic
true_rng			USB-based true RNG


DIEHARDER GENERATORS
Should follow the following format - dieharder:<generator>

borosh13			cmrg				coveyou
fishman18           fishman20           fishman2x
gfsr4               knuthran            knuthran2
knuthran2002        lecuyer21           minstd
mrg                 mt19937             mt19937_1999
mt19937_1998        r250                ran0
ran1                ran2                ran3
rand                rand48              random128-bsd
random128-glibc2    random128-libc5     random256-bsd
random256-glibc2    random256-libc5     random32-bsd
random32-glibc2     random32-libc5      random64-bsd
random64-glibc2     random64-libc5      random8-bsd
random8-glibc2      random8-libc5       random-bsd
random-glibc2       random-libc5        randu
ranf                ranlux              ranlux389
ranlxd1             ranlxd2             ranlxs0
ranlxs1             ranlxs2             ranmar
slatec              taus                taus2
taus113             transputer          tt800
uni                 uni32               vax
waterman14          zuf					stdin_input_raw
file_input_raw     	file_input 			ca
uvag               	AES_OFB 			Threefish_OFB
XOR					kiss 				superkiss
R_wichmann_hill     R_marsaglia_multic.	R_super_duper
R_mersenne_twister  R_knuth_taocp      	R_knuth_taocp2
/dev/random         /dev/urandom

'''

import random, struct, sys
from subprocess import Popen, PIPE


def random_seed():
	"""Return a random seed using /dev/random."""
	rng = random.SystemRandom()

	 # add 1 so not get 0 (which may return all 0s when used)
	return int(rng.random() * 4294967295) + 1


def dieharder_generator(seed, noise_len, generator):
	"""Read all DIEHARDER generators.

	non-crypto RNGs from DIEHARDER (unless AES_OFB or Threefish_OFB above)
	generator can be passed as name or #
	"""

	command = [ 'dieharder', '-g', generator ]
	if seed != None:
		command.extend([ '-S', str(seed) ])
	command.extend([ '-o', '-t', str(noise_len) ])
	p = Popen(command, stdin=PIPE, stdout=PIPE, stderr=PIPE)
	result, err = p.communicate()

	noise = []
	result = result.split('\n')
	for val in result:
		if '#' in val or ':' in val or len(val) == 0:
			continue
		noise.append(int(val))
	return noise


def aes_ofb(seed, noise_len):
	"""Generate RNGs using AES_OFB cryptographic generator from DIEHARDER."""
	noise = dieharder_generator(seed, noise_len, 'AES_OFB')
	return noise


def threefish(seed, noise_len):
	"""Generate RNGs using Threefish_OFB cryptographic generator from DIEHARDER."""
	noise = dieharder_generator(seed, noise_len, 'Threefish_OFB')
	return noise


def congruential(seed, noise_len):
	"""Generate congruential RNGs.

	uses these suggested settings:
	- http://www.roguebasin.com/index.php?title=Random_number_generator#Linear_congruential_generator

	also commented out below are Wolfram default settings:
	- https://reference.wolfram.com/language/tutorial/RandomNumberGeneration.html
	"""

	b = 69621					# multiplier
	c = 0						# increment
	m = 2147483647				# modulus (period of repeat always < or = m)

	# Wolfram default settings
	# b = 1283839219676404755	# multiplier
	# c = 1						# increment
	# m = 2305843009213693951 	# modulus (period of repeat always < or = m)

	if seed == None:
		seed = random_seed()

	noise = []
	prev = seed
	for i in range(noise_len):
		val = (b * prev + c) % m
		noise.append(int(val))
		prev = val
	return noise


def dev_random(seed, noise_len):
	"""Generates true random #s using /dev/random hard-drive entropy"""
	if seed == None:
		rng = random.SystemRandom()
	else:
		rng = random.SystemRandom(seed)

	noise = []
	while len(noise) < noise_len:
		val = int(rng.random() * 4294967295)
		noise.append(val)
	return noise


def truerng(noise_len, port):
	"""Reads random values from TrueRNG USB random number generator"""
	noise = []
	progress = 0.0
	print '  ',
	while len(noise) < noise_len:
		if ((progress/noise_len) * 100) % 1 == 0:
			print str(int((progress/noise_len) * 100)) + '% ... ',
			sys.stdout.flush()											# force print to show up :(
		p = Popen([ 'dd', 'if=' + port, 'count=1', 'bs=1' ],  stdin=PIPE, stdout=PIPE, stderr=PIPE)
		val, err = p.communicate()
		val = struct.unpack('@B', val)[0]
		val *= 16843009 - 1
		noise.append(val)
		progress += 1
	print ''
	return noise

