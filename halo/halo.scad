// Created in 2020 by Your Name Here.
// This work is released with CC0 into the public domain.
// https://creativecommons.org/publicdomain/zero/1.0/

include <../common/shapes.scad>

$fn=200;

diameter=160;
ledwidth=8;
height=6;
wall=2.4;


difference() {
	difference () {
		ring(diameter, diameter-wall*4-ledwidth*2, height);
		translate([0,0,4]) color([1,0,0]) ring(diameter-wall*2, diameter-wall*2-ledwidth*2, height+2);
	}
	translate([0,((diameter-wall*2+ledwidth)/2)/2,0]) color([1,0,0]) cylinder(d=2.5,h=8);
}

