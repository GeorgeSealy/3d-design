ringWidth = 5;
tolerance = 0.5;

module ring(diameter = 25, height = 1) {
    difference() {
        cylinder(h = height, r = diameter / 2 + ringWidth, $fn = 144);
        union() {
            cylinder(h = height, r1 = diameter / 2 - tolerance, r2 = diameter / 2, $fn = 144);
            translate([0, 0, -0.1]) cylinder(h = 1, r = diameter / 2 - tolerance, $fn = 144);
            translate([0, 0, height - 0.01]) cylinder(h = 1, r = diameter / 2, $fn = 144);
        };
    };
};

translate([0, 0, 0]) ring(diameter = 23.5, height = 1.4);
//translate([0, 0, 0]) ring(diameter = 31.5, height = 1.4);
