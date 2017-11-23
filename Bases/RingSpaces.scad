ringWidth = 5;
tolerance = 0.5;
ringHeight = 1;

module ring(diameter = 25) {
    difference() {
        cylinder(h = ringHeight, r = diameter / 2 + ringWidth, $fn = 144);
        union() {
            cylinder(h = ringHeight, r1 = diameter / 2 - tolerance, r2 = diameter / 2, $fn = 144);
            translate([0, 0, -ringHeight / 2]) cylinder(h = 1, r = diameter / 2 - tolerance, $fn = 144);
            translate([0, 0, ringHeight - 0.01]) cylinder(h = 1, r = diameter / 2, $fn = 144);
        };
    };
};

translate([40, 0, 0]) ring(diameter = 25);
translate([0, 0, 0]) ring(diameter = 24);
translate([-40, 0, 0]) ring(diameter = 23);
