fillDiameter = 28;
fillTaper = 2;
fillHeight = 2.2;
slotInset = 4;
slotWidth = 6;
slotHeight = 2 * fillHeight;
slotOffset = 1;
fillBaseHeight = 0.3;

difference() {
    cylinder(h=fillHeight, d1 = fillDiameter, d2 = fillDiameter - fillTaper, $fn=144);
    translate([0, slotOffset, fillBaseHeight + slotHeight / 2]) cube([fillDiameter - slotInset, slotWidth, slotHeight], center = true);
};