manholeDiameter = 20;
manholeHeight = 2;
cutDepth = 0.5;

innerCircleDiameter = manholeDiameter - 1.5;
cutHeight = manholeHeight - cutDepth + 0.1;

difference() {
    union() {
        translate([0, 0, cutHeight]) cylinder(h = manholeHeight - cutHeight, d = manholeDiameter, $fn=144);
        cylinder(h = cutHeight, d = manholeDiameter - 1, $fn=144);
    };
    
    translate([0, 0, manholeHeight - cutDepth]) union() {
        
        for (i = [0: 16]) { 
            rotate([0, 0, i * 360 / 16])
            translate([0, 0, manholeHeight]) 
                cube([manholeDiameter + 1, 0.5, 2 * manholeHeight], center = true);
        };

       
        difference() {
            translate([0, 0, manholeHeight]) cylinder(h = 2 * manholeHeight, d = innerCircleDiameter, $fn=144, center = true);
            cylinder(h = 4 * manholeHeight, d = innerCircleDiameter - 1, $fn=144, center = true);
        };        
        
    };
};