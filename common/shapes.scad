module hexagon(radius, height) {
  cylinder(r=radius,$fn=6,h=height);
}
module ring(d1, d2, h) {
    difference() {
        cylinder(d = d1, h = h);
        translate([ 0, 0, -1 ]) cylinder(d = d2, h = h+2);
    }
}

