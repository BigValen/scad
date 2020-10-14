// Created in 2020 by Your Name Herehunndjbhtbhcnbleuvbvr.
// This work is released with CC0 into the public domain.
// https://creativecommons.org/publicdomain/zero/1.0/

$fn=30;

mon_thick=20;
m6_diam=11.55;
m6_thick=4;
m6_head=3;
b_depth=35;
b_width=30;
b_height=16;
clasp_thick=6.78;
clasp_hole_i=7.9;
clasp_hole_o=18;
clasp_offset_z=5.5;
clasp_offset_y=-20;
clasp_offset_x=(clasp_thick*3-b_depth)/2+2;
clasp_offset=[clasp_offset_x,clasp_offset_y,clasp_offset_z];
gap_offset=[clasp_offset_x-1,clasp_offset_y+mon_thick/2,clasp_offset_z+6];

include <../common/shapes.scad>
include <../common/colours.scad>
include <../common/roundedcube.scad>
difference() {
union() {
        difference() {
            difference() {
                color("grey",0.8) rotate([0,90,0]) ring(clasp_hole_o, clasp_hole_i, clasp_thick*3); 
                color(blue) rotate([0,90,0]) translate([0, 0, -0.1]) rotate([0,0,30]) hexagon(m6_diam/2, m6_thick+0.01);
            }
            color(magenta) rotate([0,90,0]) translate([0, 0, clasp_thick*3-m6_head]) cylinder(d=m6_diam, h=m6_head+0.01);
        }

    difference(){
        color("gray", 0.8) translate(clasp_offset) {
                roundedcube(size=[b_width,b_depth,b_height]);
        }

        color("orange") translate(gap_offset) cube([b_width+2,mon_thick,b_height]);
    }
}
        color("pink") rotate([0,90,0]) translate([0, 0, clasp_thick]) cylinder(d=clasp_hole_o+0.01,h=clasp_thick);
    }
