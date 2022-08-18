/// @description CREATE PARTICLE

var amount = irandom_range(1, 4)
repeat(amount) {
	var length = 10	
	var angleRand = random_range(-15, 15) 
	var xRand = x + lengthdir_x(length, direction - 180 + angleRand)
	var yRand = y + lengthdir_y(length, direction - 180 + angleRand)
	
	part_type_orientation(particle_trail, direction, direction, 0, 0, 0)
	part_particles_create(particle_syst, xRand, yRand, particle_trail, 1)
}

var randLoop = irandom_range(loopAlarmMin, loopAlarmMax)

alarm_set(0, randLoop)

