
// Base Plate
module base_plate() {
    difference() {
        // Main oval plate
        hull() {
            translate([-20, 0, 0]) circle(10);
            translate([20, 0, 0]) circle(10);
        }
        // Cutout for the pins
        translate([-10, 0, 0]) cylinder(h=5, r=2, center=true);
        translate([10, 0, 0]) cylinder(h=5, r=2, center=true);
    }
    // Pins
    translate([-10, 0, 5]) cylinder(h=10, r=2, center=false);
    translate([10, 0, 5]) cylinder(h=10, r=2, center=false);
}

// Clamp
module clamp() {
    difference() {
        // Semi-circular body
        translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(h=10, r=15, center=true);
        // Hollow interior
        translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(h=10, r=12, center=true);
    }
    // Cylindrical extensions
    translate([-10, 0, 0]) cylinder(h=5, r=2, center=false);
    translate([10, 0, 0]) cylinder(h=5, r=2, center=false);
}

// Connector
module connector() {
    difference() {
        // Rectangular body
        translate([-10, -5, 0]) cube([20, 10, 2], center=true);
        // Hollow center
        translate([-5, -2.5, 0]) cube([10, 5, 2], center=true);
        // Notch
        translate([-10, -5, 0]) cube([5, 10, 2], center=true);
    }
}

// Spacer
module spacer() {
    difference() {
        // Ring-like structure
        translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(h=2, r=10, center=true);
        // Hollow center
        translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(h=2, r=8, center=true);
    }
}

// Pin
module pin() {
    // Cylindrical rod
    translate([0, 0, 0]) cylinder(h=20, r=2, center=false);
}

// Assembly
module assembly() {
    // Layer 4: Base Plate
    translate([0, 0, 0]) base_plate();
    // Pins on base plate
    translate([-10, 0, 5]) pin();
    translate([10, 0, 5]) pin();

    // Layer 3: Connector
    translate([0, 0, 15]) connector();

    // Layer 2: Spacer
    translate([0, 0, 17]) spacer();

    // Layer 1: Clamp
    translate([0, 0, 19]) clamp();
}

// Render the assembly
assembly();

