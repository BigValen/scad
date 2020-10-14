// Created in 2020 by Your Name Here.
// This work is released with CC0 into the public domain.
// https://creativecommons.org/publicdomain/zero/1.0/

	

translate([-24,0,0]) {
    union() {
        cube(15, center=true);
        sphere(10);
    }
}

intersection() {
    cube(13, center=true);
    sphere(10);
    translate([5, 0, 0]) { cube(15, center=true); }
}

translate([24,0,0]) {
    difference() {
	sphere(10);
	cube(16, center=true);
    }
}

echo(version=version());
