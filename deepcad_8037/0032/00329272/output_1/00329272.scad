
// Base Plate
module base_plate() {
    difference() {
        cube([60, 40, 10], center = false); // Main rectangular block
        translate([50, 0, 0]) cube([10, 10, 10], center = false); // Notch on one edge
    }
}

// Intermediate Plate
module intermediate_plate() {
    difference() {
        cube([60, 40, 5], center = false); // Main rectangular block
        translate([50, 0, 0]) cube([10, 10, 5], center = false); // Cutout on one side
    }
}

// Top Plate
module top_plate() {
    cube([60, 40, 2], center = false); // Flat rectangular plate
}

// Assembly
module assembly() {
    translate([0, 0, 15]) top_plate(); // Positioning the top plate
    translate([0, 0, 10]) intermediate_plate(); // Positioning the intermediate plate
    base_plate(); // Positioning the base plate
}

// Render the assembly
assembly();

