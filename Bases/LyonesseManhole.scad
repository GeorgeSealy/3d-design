manholeDiameter = 18;
manholeHeight = 2;
cutDepth = 0.7;

innerCircleDiameter = manholeDiameter - 1.75;
cutHeight = manholeHeight - cutDepth + 0.1;

module manhole() {
difference() {
    union() {
        translate([0, 0, cutHeight]) cylinder(h = manholeHeight - cutHeight, d = manholeDiameter, $fn=144);
        cylinder(h = cutHeight, d = manholeDiameter - 1, $fn=144);
    };
    
    translate([0, 0, manholeHeight - cutDepth]) union() {
        
        for (i = [-1: 1]) { 
            rotate([0, 0, i * 360 / 16])
            translate([manholeDiameter * 0.8, 0, manholeHeight]) 
                cube([manholeDiameter + 1, 0.6, 2 * manholeHeight], center = true);
        };
        
        for (i = [7: 9]) { 
            rotate([0, 0, i * 360 / 16])
            translate([manholeDiameter * 0.8, 0, manholeHeight]) 
                cube([manholeDiameter + 1, 0.6, 2 * manholeHeight], center = true);
        };
        
        for (i = [2: 6]) { 
            rotate([0, 0, i * 360 / 16])
            translate([manholeDiameter * 0.7, 0, manholeHeight]) 
                cube([manholeDiameter + 1, 0.6, 2 * manholeHeight], center = true);
        };
        
        for (i = [10: 14]) { 
            rotate([0, 0, i * 360 / 16])
            translate([manholeDiameter * 0.7, 0, manholeHeight]) 
                cube([manholeDiameter + 1, 0.6, 2 * manholeHeight], center = true);
        };

        difference() {
            union() {
                translate([0, 0, manholeHeight]) cube([manholeDiameter * 0.6, 5, 2 * manholeHeight], center = true);
                translate([0, 0, manholeHeight]) cylinder(d = manholeDiameter * 0.4, h = 2 * manholeHeight, center = true, $fn=144);
            };
            union() {
                translate([0, 0, manholeHeight]) cube([manholeDiameter * 0.6 - 1, 3, 2 * manholeHeight], center = true);
                translate([0, 0, manholeHeight]) cylinder(d = manholeDiameter * 0.4 - 1, h = 2 * manholeHeight, center = true, $fn=144);
            };
        };
       
        difference() {
            translate([0, 0, manholeHeight]) cylinder(h = 2 * manholeHeight, d = innerCircleDiameter, $fn=144, center = true);
            cylinder(h = 4 * manholeHeight, d = innerCircleDiameter - 1, $fn=144, center = true);
        };        
        
    };
};
};

union() {
    
    manhole();

    translate([25, 0, 0]) union() {
        
        difference() {
            translate([0, 0, 0]) cylinder(h = cutHeight, d = manholeDiameter + 1.2, $fn=144);
            translate([0, 0, -1]) cylinder(h = cutHeight + 2, d = manholeDiameter + 0.1, $fn=144);
        };
        
        difference() {
            translate([0, 0, 0]) cylinder(h = manholeHeight / 3, d = manholeDiameter + 2, $fn=144);
            translate([0, 0, -1]) cylinder(h = manholeHeight + 0.1, d = manholeDiameter -1 + 0.1, $fn=144);
        };
        //cylinder(h = cutHeight, d = manholeDiameter - 1, $fn=144);
    };
};    
