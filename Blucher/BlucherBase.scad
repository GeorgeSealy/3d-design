baseLength = 90;
baseWidth = 65;
baseHeight = 2.6;
baseCorner = 1;
figureStandHeight = 1;
grassHeight = 0.7;

sabotLength = 60;
sabotWidth = 40;
sabotHeight = 2.2;

sabotTolerance = 0.5;
diceSize = 8;

module noise() {
    scale([1.0 / 100.0, 1.0 / 100.0, 1.0 / 100.0]) surface(file = "Noise.png", center = true, invert = false);
};

module firepower() {
    scale([1.0 / 100.0, 1.0 / 100.0, 1.0 / 100.0]) surface(file = "Firepower.png", center = true, invert = false);
};

module baseShape(length = baseLength, width = baseWidth, height = baseHeight) {
    union() {
            
        translate([0, 0, height / 2]) cube([length, width, height], center = true);
        translate([0, 0, height]) scale([length, width, grassHeight]) noise();
    };

};

module cylindricalRect(length = baseLength, width = baseWidth, height = 1, cornerRadius = baseCorner) {

    cx = length / 2 - cornerRadius;
    cy = width / 2 - cornerRadius;
    cl = length - 2 * cornerRadius;
    cw = width - 2 * cornerRadius;
    
    scale([1, 1, 1]) union() {
        translate([cx, cy, 0]) cylinder(h = height, r = cornerRadius, $fn = 72);
        translate([-cx, cy, 0]) cylinder(h = height, r = cornerRadius, $fn = 72);
        translate([cx, -cy, 0]) cylinder(h = height, r = cornerRadius, $fn = 72);
        translate([-cx, -cy, 0]) cylinder(h = height, r = cornerRadius, $fn = 72);
        translate([0, 0, height / 2]) cube([length, 2 * cy, height], center = true);
        translate([0, 0, height / 2]) cube([2 * cx, width, height], center = true);
    };
};

module infoBar() {
    // Info bar
    infoOffY = 1 - (baseWidth - diceSize) / 2;
    infoLength = baseLength - 15 - diceSize;
    
    translate([-6 + (baseLength - infoLength) / 2, infoOffY, baseHeight - 1]) sabot(length = infoLength, width = diceSize, cutout = true);
    
    // Dice
    translate([6 - (baseLength - diceSize) / 2, infoOffY, 1]) sabot(length = diceSize, width = diceSize, cutout = true);
};

module sabot(length = sabotLength, width = sabotWidth, height = 2 * sabotHeight, cutout = false, filled = false) {

	if (cutout) {
		tolerance = sabotTolerance;
		translate([0, 0, height / 2]) cube([length + tolerance, width + tolerance, height], center = true);
	} else {
        border = 0.8;

		translate([0, 0, height / 2]) difference() {
    		cube([length, width, height], center = true);

    		if (!filled) {
            	translate([0, 0, 1]) cube([length - 2 * border, width - 2 * border, height], center = true);
            };
    	};
    };
};

module sabotsFrenchInfantryWithArty(tolerance = 0, cutouts = true) {
            
    skirmishLineY = 21;
    mainLineY = 3.5;
    commanderLineY = -15;
    
    difference() {
        union() {

            if (cutouts) {
                sabot(length = 80, width = 20, offX = 0, offY = mainLineY, tolerance = tolerance);
            } else {
                // Infantry
                sabot(length = 30, width = 20, offX = 30, offY = mainLineY, tolerance = tolerance);
                sabot(length = 30, width = 20, offX = -30, offY = mainLineY, tolerance = tolerance);
            
                // Artillery
                sabot(length = 20, width = 20, offX = 0, offY = mainLineY, tolerance = tolerance);
            };
            
            // Skirmishers
            sabot(length = 30, width = 9, offX = 25, offY = skirmishLineY, tolerance = tolerance);
            sabot(length = 30, width = 9, offX = -25, offY = skirmishLineY, tolerance = tolerance);
            
            // Commander
            sabot(length = 10, width = 12, offX = 0, offY = commanderLineY, tolerance = tolerance);
            
            if (cutouts) {
                infoBar(tolerance = tolerance);
            };
        };
        
        if (!cutouts) {
            
            border = 0.8;
            translate([0, 0, 1]) union() {
                
                // Skirmishers
                sabot(length = 30 - 2 * border, width = 9 - 2 * border, offX = 25, offY = skirmishLineY, tolerance = tolerance);
                sabot(length = 30 - 2 * border, width = 9 - 2 * border, offX = -25, offY = skirmishLineY, tolerance = tolerance);
                
                // Infantry
                sabot(length = 30 - 2 * border, width = 20 - 2 * border, offX = 30, offY = mainLineY, tolerance = tolerance);
                sabot(length = 30 - 2 * border, width = 20 - 2 * border, offX = -30, offY = mainLineY, tolerance = tolerance);
            
                // Artillery
                sabot(length = 20 - 2 * border, width = 20 - 2 * border, offX = 0, offY = mainLineY, tolerance = tolerance);
            
                // Commander
                sabot(length = 10 - 2 * border, width = 12 - 2 * border, offX = 0, offY = commanderLineY, tolerance = tolerance);

            };
        };
    };
};

module sabotsFrenchInfantry(tolerance = 0, cutouts = true) {
            
    skirmishLineY = 16;
    mainLineY = -5;
    commanderLineY = -4;
    spacingX = 23;
    
    difference() {
        union() {

            sabot(length = 30, width = 20, offX = spacingX, offY = mainLineY, tolerance = tolerance);
            sabot(length = 30, width = 20, offX = -spacingX, offY = mainLineY, tolerance = tolerance);
            
            // Skirmishers
            sabot(length = 30, width = 9, offX = spacingX, offY = skirmishLineY, tolerance = tolerance);
            sabot(length = 30, width = 9, offX = -spacingX, offY = skirmishLineY, tolerance = tolerance);
            
            // Commander
            sabot(length = 10, width = 12, offX = 0, offY = commanderLineY, tolerance = tolerance);
            
            if (cutouts) {
                infoBar(tolerance = tolerance);
            };
        };
        
        if (!cutouts) {
            border = 0.8;
            translate([0, 0, 1]) union() {
                
                // Skirmishers
                sabot(length = 30 - 2 * border, width = 9 - 2 * border, offX = spacingX, offY = skirmishLineY, tolerance = tolerance);
                sabot(length = 30 - 2 * border, width = 9 - 2 * border, offX = -spacingX, offY = skirmishLineY, tolerance = tolerance);
                
                // Infantry
                sabot(length = 30 - 2 * border, width = 20 - 2 * border, offX = spacingX, offY = mainLineY, tolerance = tolerance);
                sabot(length = 30 - 2 * border, width = 20 - 2 * border, offX = -spacingX, offY = mainLineY, tolerance = tolerance);
            
                // Commander
                sabot(length = 10 - 2 * border, width = 12 - 2 * border, offX = 0, offY = commanderLineY, tolerance = tolerance);

            };
        };
    };
};

module sabotsCavalry(tolerance = 0, cutouts = true) {
  cavalryWidth = 30;
  cavalryDepth = 15;  
    
  commanderLineY = 7;
  firstLineY = 10;
  secondLineY = -10;
  spacingX = 22;
   
  difference() {
      union() {

          sabot(length = cavalryWidth, width = cavalryDepth, offX = spacingX, offY = firstLineY, tolerance = tolerance);
          sabot(length = cavalryWidth, width = cavalryDepth, offX = -spacingX, offY = firstLineY, tolerance = tolerance);
          sabot(length = cavalryWidth, width = cavalryDepth, offX = spacingX, offY = secondLineY, tolerance = tolerance);
          sabot(length = cavalryWidth, width = cavalryDepth, offX = -spacingX, offY = secondLineY, tolerance = tolerance);

          sabot(length = 10, width = cavalryDepth, offX = 0, offY = commanderLineY, tolerance = tolerance);
            
          if (cutouts) {
              infoBar(tolerance = tolerance);
          };
      };
        
      if (!cutouts) {
          border = 0.8;
          translate([0, 0, 1]) union() {
                
              sabot(length = cavalryWidth - 2 * border, width = cavalryDepth - 2 * border, offX = spacingX, offY = firstLineY, tolerance = tolerance);
              sabot(length = cavalryWidth - 2 * border, width = cavalryDepth - 2 * border, offX = -spacingX, offY = firstLineY, tolerance = tolerance);
              sabot(length = cavalryWidth - 2 * border, width = cavalryDepth - 2 * border, offX = spacingX, offY = secondLineY, tolerance = tolerance);
              sabot(length = cavalryWidth - 2 * border, width = cavalryDepth - 2 * border, offX = -spacingX, offY = secondLineY, tolerance = tolerance);
                
              sabot(length = 10 - 2 * border, width = cavalryDepth - 2 * border, offX = 0, offY = commanderLineY, tolerance = tolerance);
          };
      };
    };
};

module sabotsArtillery(tolerance = 0, cutouts = true) {
    
  mainLineY = 5;
  spacingX = 30;
   
  difference() {
      union() {

          sabot(length = 20, width = 20, offX = 0, offY = mainLineY, tolerance = tolerance);
          sabot(length = 20, width = 20, offX = -spacingX, offY = mainLineY, tolerance = tolerance);
          sabot(length = 20, width = 20, offX = spacingX, offY = mainLineY, tolerance = tolerance);

          if (cutouts) {
              infoBar(tolerance = tolerance);
          };
      };
        
      if (!cutouts) {
          border = 0.8;
          translate([0, 0, 1]) union() {
                
            sabot(length = 20 - 2 * border, width = 20 - 2 * border, offX = 0, offY = mainLineY, tolerance = tolerance);
            sabot(length = 20 - 2 * border, width = 20 - 2 * border, offX = -spacingX, offY = mainLineY, tolerance = tolerance);
            sabot(length = 20 - 2 * border, width = 20 - 2 * border, offX = spacingX, offY = mainLineY, tolerance = tolerance);

          };
      };
    };
};

module sabotsBritishInfantryWithArty(tolerance = 0, cutouts = true) {
              
    skirmishLineY = 22;
    mainLineY = 6.5;
    commanderLineY = -10;
    sideX = 22.5;

    union() {
            
        // Skirmishers
        translate([sideX, skirmishLineY, 0]) sabot(length = 40, width = 7, cutout = cutout, filled = filled);
        translate([-sideX, skirmishLineY, 0]) sabot(length = 40, width = 7, cutout = cutout, filled = filled);

        // Infantry
        translate([sideX, mainLineY, 0]) sabot(length = 40, width = 13, cutout = cutout, filled = filled);
        translate([-sideX, mainLineY, 0]) sabot(length = 40, width = 13, cutout = cutout, filled = filled);
            
        // Artillery
        translate([8, commanderLineY - 2, 0]) sabot(length = 20, width = 20, cutout = cutout, filled = filled);
            
        // Commander
        translate([-10, commanderLineY, 0]) sabot(length = 8, width = 12, cutout = cutout, filled = filled);
        
    };
};

module sabotsBritishInfantry(cutout = false, filled = false) {
              
    skirmishLineY = 20;
    mainLineY = 2;
    commanderLineY = -14;
    sideX = 22.5;
/*
    skirmishLineY = 15;
    mainLineY = -10;
    commanderLineY = 4;
    sideX = 22;
*/
    union() {
            
        // Skirmishers
        translate([sideX, skirmishLineY, 0]) sabot(length = 40, width = 7, cutout = cutout, filled = filled);
        translate([-sideX, skirmishLineY, 0]) sabot(length = 40, width = 7, cutout = cutout, filled = filled);

        // Infantry
        translate([sideX, mainLineY, 0]) sabot(length = 40, width = 13, cutout = cutout, filled = filled);
        translate([-sideX, mainLineY, 0]) sabot(length = 40, width = 13, cutout = cutout, filled = filled);
            
        // Commander
        translate([0, commanderLineY, 0]) sabot(length = 6, width = 12, cutout = cutout, filled = filled);
        
    };
};

module centreMarking(length = 5, width = 1.5, height = 0.0 + grassHeight) {
    translate([0, (baseWidth - length) / 2, baseHeight + height / 2]) cube([width, length, height], center = true);
};

module angleMarkings(length = 7, width = 1.5, height = 0.0 + grassHeight) {
    translate([baseLength / 2, baseWidth / 2, baseHeight + height / 2]) rotate(a = -45) translate([0, -length / 2, 0]) cube([width, length, height], center = true);
    translate([-baseLength / 2, baseWidth / 2, baseHeight + height / 2]) rotate(a = 45) translate([0, -length / 2, 0]) cube([width, length, height], center = true);
};

union() {
/**/
    intersection() {
        union() {
            difference() {
                baseShape();

                union() {
            		infoBar(tolerance = 0);
                	translate([0, 0, baseHeight - sabotHeight]) sabotsBritishInfantry(cutout = true);
//                translate([0, 0, baseHeight - sabotHeight]) sabotsBritishInfantryWithArty(cutout = true);
//                translate([0, 0, baseHeight - sabotHeight]) sabotsFrenchInfantryWithArty(tolerance = sabotTolerance);
//                translate([0, 0, baseHeight - sabotHeight]) sabotsFrenchInfantry(tolerance = sabotTolerance);
//                translate([0, 0, baseHeight - sabotHeight]) sabotsCavalry(tolerance = sabotTolerance);
//                translate([0, 0, baseHeight - sabotHeight]) sabotsArtillery(tolerance = sabotTolerance);
                };

            };
            
            centreMarking();
            angleMarkings();

            //translate([38, -19, 0.0]) scale([6, 6, baseHeight + grassHeight]) firepower();
        };
        
        scale([1, 1, 20]) translate([0, 0, -0.5]) cylindricalRect();

    };
/**/
/**/
    intersection() {
        baseShape();
        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsBritishInfantry(cutout = false, filled = false);
//        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsBritishInfantryWithArty(cutout = false, filled = false);

//        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsFrenchInfantryWithArty(cutouts = false);
//        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsFrenchInfantry(cutouts = false);
//        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsCavalry(cutouts = false);
//        translate([0, 0, baseHeight - sabotHeight + 0.5]) sabotsArtillery(cutouts = false);
     };
/**/
};