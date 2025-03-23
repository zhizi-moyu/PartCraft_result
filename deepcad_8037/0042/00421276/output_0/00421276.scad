
// Parameters
plate_thickness = 5; // Thickness of side and connecting plates
block_width = 40;    // Width of the central block
block_height = 20;   // Height of the central block
block_length = 60;   // Length of the central block
plate_length = 60;   // Length of side and connecting plates
plate_width = 20;    // Width of side and connecting plates
bolt_diameter = 4;   // Diameter of bolts
bolt_length = 70;    // Length of bolts
nut_diameter = 6;    // Diameter of nuts
nut_thickness = 3;   // Thickness of nuts
hole_spacing = 30;   // Distance between bolt holes

// Central Block
module central_block() {
    difference() {
        cube([block_length, block_width, block_height], center = true);
        for (x = [-hole_spacing/2, hole_spacing/2]) {
            for (y = [-block_width/2 + 5, block_width/2 - 5]) {
                translate([x, y, 0])
                    cylinder(r = bolt_diameter/2, h = block_height + 2, center = true);
            }
        }
    }
}

// Side Plate
module side_plate() {
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        for (x = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, 0, 0])
                cylinder(r = bolt_diameter/2, h = plate_thickness + 2, center = true);
        }
    }
}

// Connecting Plate
module connecting_plate() {
    difference() {
        cube([plate_length, plate_width, plate_thickness], center = true);
        for (x = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, 0, 0])
                cylinder(r = bolt_diameter/2, h = plate_thickness + 2, center = true);
        }
    }
}

// Bolt
module bolt() {
    cylinder(r = bolt_diameter/2, h = bolt_length, center = false);
}

// Nut
module nut() {
    cylinder(r = nut_diameter/2, h = nut_thickness, center = false);
}

// Assembly
module assembly() {
    // Layer 1: Top Connecting Plate
    translate([0, 0, bolt_length/2])
        connecting_plate();

    // Layer 2: Top Side Plates
    translate([0, plate_width/2 + block_width/2, bolt_length/2 - plate_thickness])
        side_plate();
    translate([0, -plate_width/2 - block_width/2, bolt_length/2 - plate_thickness])
        side_plate();

    // Layer 3: Central Block
    translate([0, 0, bolt_length/2 - plate_thickness - block_height/2])
        central_block();

    // Layer 4: Bottom Side Plates
    translate([0, plate_width/2 + block_width/2, bolt_length/2 - plate_thickness - block_height - plate_thickness])
        side_plate();
    translate([0, -plate_width/2 - block_width/2, bolt_length/2 - plate_thickness - block_height - plate_thickness])
        side_plate();

    // Layer 5: Bottom Connecting Plate
    translate([0, 0, bolt_length/2 - plate_thickness - block_height - 2*plate_thickness])
        connecting_plate();

    // Fasteners: Bolts and Nuts
    for (x = [-hole_spacing/2, hole_spacing/2]) {
        for (y = [-block_width/2 + 5, block_width/2 - 5]) {
            translate([x, y, bolt_length/2 - plate_thickness - block_height/2])
                bolt();
            translate([x, y, bolt_length/2 - plate_thickness - block_height - 2*plate_thickness - nut_thickness])
                nut();
        }
    }
}

// Render the assembly
assembly();

