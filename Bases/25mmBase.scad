diameter = 75;
height = 1.8;
inset_height = 0.6;
base_height = height - inset_height - 0.6;
scale = 1.5;

union() {

    translate([0, 0, base_height]) difference() {
            scale([scale * 1, 1, 0.35]) sphere(d = diameter - 0.4, $fn = 144);
            union() {
                translate([0, 0, height - base_height]) scale([scale * 1, 1, 1]) cylinder(h=100, d = 100);
                translate([0, 0, height - base_height - inset_height]) scale([scale * 1, 1, 1]) cylinder(h=100, d = diameter - 2, $fn = 144);
                translate([0, 0, -100]) scale([scale * 1, 1, 1]) cylinder(h=100, d = 100);
            }
        };
    scale([scale * 1, 1, 1]) cylinder(h=base_height, d=diameter - 0.4, $fn=144);
};
