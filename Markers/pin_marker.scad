radius = 15;
hole_radius = 5;
inner_hole_radius = 4;
lower_height = 1.5;
upper_height = 1.5;
disc_height = 1.2;
height = lower_height + upper_height + disc_height;
inset = 0.45;
smidge = 0.1;
hole_angle = 18;

union() {
    /**/
    difference() {
        cylinder(h=height - upper_height + inset, r=radius, $fn = 144);
        translate([0, 0, lower_height]) difference() {
            cylinder(h=100, r=radius + 1, $fn = 144);
            translate([0, 0, -1]) difference() {
                cylinder(h=100, r=hole_radius, $fn = 144);
                translate([0, 0, -1]) cylinder(h=100, r=inner_hole_radius, $fn = 144);
            }
        }
    }
    
    /**/

    /**/
    translate([2.5 * radius, 0, 0]) difference() {
        cylinder(h=upper_height, r=radius, $fn = 144);
        
        union() {
            translate([0, 0, upper_height - inset]) difference() {
                cylinder(h=100, r=hole_radius + 0.25, $fn = 144);
                translate([0, 0, -1]) cylinder(h=100, r=inner_hole_radius - 0.25, $fn = 144);
            }
            
            translate([0, 0, -5]) difference() {
                cylinder(h=100, r=radius + 5, $fn = 144);
                translate([0, 0, -5]) union() {
                    cylinder(h=200, r=radius - 6.5, $fn = 144);
                    rotate(-hole_angle, [0, 0, 1]) scale([radius + 5, 2 * (radius + 5), 1]) translate([0.5, 0, 0.0]) cube([1, 1, 220], center=true);
                    rotate(180 + hole_angle, [0, 0, 1]) scale([radius + 5, 2 * (radius + 5), 1]) translate([0.5, 0, 0.0]) cube([1, 1, 220], center=true);
                }
            }
        }
    }
    /**/
    /**/
    translate([-2.5 * radius, 0, 0]) difference() {
        cylinder(h=disc_height, r=radius + 1, $fn = 144);
        union() {
            
            translate([0, 0, -1]) cylinder(h=200, r=hole_radius + 0.5, $fn = 144);

            for(i=[0:9]) {
                
                rotate(i * 36, [0, 0, 1]) translate([0, radius - 3, disc_height - inset]) scale([0.4, 0.4, 1]) linear_extrude(height=20) text(str(i), font="Impact:style=Regular", halign="center", valign="center");
            }
        }
    }
    /**/
}
