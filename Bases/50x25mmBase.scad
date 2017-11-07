difference() {
//    minkowski() {
        union() {
            translate([12.5, 0, 0]) { cylinder(h=1.2, d = 25); }
            translate([-12.5, 0, 0]) { cylinder(h=1.2, d = 25); }
            translate([0, 0, 0.6]) { cube([25, 25, 1.2], center=true); }
        };
//        sphere(0.15);
//    };
        translate([0, 0, 0.9]) union() {
        translate([12.5, 0, 0]) { cylinder(h=1, d = 24.4); }
        translate([-12.5, 0, 0]) { cylinder(h=1, d = 24.4); }
        translate([0, 0, 0.5]) { cube([24.4, 24.4, 1], center=true); }
    };

}