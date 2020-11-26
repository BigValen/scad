
module plate() {
    distance=20;
    nut_height=5;
    plate_x=6;
    screw_x=42;
    plate_t=18; //thickness
	arm_height=30;
    bottom_bearing_h=14;
    top_bearing_h=20;
    
    difference() {
        union() {
            // Disk Plate
            color("orange") hull() {
                top_bearing_z = bottom_bearing_h+arm_height;
                translate([plate_x,-5,top_bearing_z]) cube([plate_t,70,top_bearing_h+10]);
                translate([35,30,top_bearing_z]) cylinder(r=45/2,h=top_bearing_h, $fn=200);
            }
            color("teal")  translate([plate_x,-5,bottom_bearing_h]) cube([plate_t,70,arm_height]);
            color("turquoise") hull() {
                translate([plate_x,-5,0]) cube([plate_t,70,bottom_bearing_h]);
                // bearing
                translate([35,30,0]) cylinder(r=45/2,h=bottom_bearing_h, $fn=200);
            }
            color("tomato") minkowski() {
                rotate([0,90,0]) translate([1,-4,0]) cube([plate_t, 68, 60]);
                color([0,0.4,0]) cylinder(r=4, h=1, $fn=200);
            }

        } 
        union() {
            // main screw hole
            color([0.3,0.3,0.8]) translate([screw_x,30,-21]) cylinder(r=4.2,h=100, $fn=200);
            //hull() for(z=[0,20])
            color("cyan") translate([screw_x,30,top_bearing_h+40]) cylinder(r=22.2/2,h=40, $fn=200);
            color("cyan") translate([screw_x,30,-20]) cylinder(r=7.25,h=6, $fn=6);
            color("gray") translate([screw_x,30,top_bearing_h+39]) cylinder(r=13/2, h=2, $fn=200);

			// wall screws
			translate([0,0,-2-plate_t]) cylinder(r=4/2, h=plate_t+4, $fn=200);
			translate([0,60,-2-plate_t]) cylinder(r=4/2, h=plate_t+4, $fn=200);
			translate([60,0,-2-plate_t]) cylinder(r=4/2, h=plate_t+4, $fn=200);
			translate([60,60,-2-plate_t]) cylinder(r=4/2, h=plate_t+4, $fn=200);
		}
    }

}


plate();

