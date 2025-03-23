
// Define parameters for the flat plates
plate_width = 60;  // Adjusted width to match the original model
plate_height = 60; // Adjusted height to match the original model
plate_thickness = 1.5; // Reduced thickness to match the original model
plate_spacing = 5; // Spacing between each layer

// Module to create a flat plate
module flat_plate() {
    cube([plate_width, plate_height, plate_thickness], center = true);
}

// Module to create a tilted flat plate
module tilted_plate(angle) {
    rotate([angle, 0, 0]) flat_plate();
}

// Assemble the layers based on the graph_dict
module assembly() {
    // Layer 1: Topmost flat plate (horizontal orientation)
    translate([0, 0, plate_spacing * 2.5]) flat_plate();
    
    // Layer 2: Second flat plate (horizontal orientation)
    translate([0, 0, plate_spacing * 1.5]) flat_plate();
    
    // Layer 3: Third flat plate (horizontal orientation)
    translate([0, 0, plate_spacing * 0.5]) flat_plate();
    
    // Layer 4: Fourth flat plate (horizontal orientation)
    translate([0, 0, -plate_spacing * 0.5]) flat_plate();
    
    // Layer 5: Fifth flat plate (vertical orientation, aligned)
    translate([0, 0, -plate_spacing * 1.5]) rotate([90, 0, 0]) flat_plate();
    
    // Layer 6: Bottommost flat plate (vertical orientation, aligned)
    translate([0, 0, -plate_spacing * 2.5]) rotate([90, 0, 0]) flat_plate();
}

// Render the assembly
assembly();

