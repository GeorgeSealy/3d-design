fillDiameter = 25;
fillTaper = 1;
fillHeight = 2.5;
slotInset = 4;
slotWidth = 4;
slotHeight = 2 * fillHeight;
slotOffset = 1;
fillBaseHeight = 0.3;

difference() {
    cylinder(h=fillHeight, d1 = fillDiameter, d2 = fillDiameter - fillTaper, $fn=144);
    translate([0, slotOffset, fillBaseHeight + slotHeight / 2]) cube([fillDiameter - slotInset, slotWidth, slotHeight], center = true);
};