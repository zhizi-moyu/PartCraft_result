
// Define parameters for the flat plates
plate_width = 50;  // Width of the flat plate
plate_height = 50; // Height of the flat plate
plate_thickness = 2; // Thickness of the flat plate
plate_spacing = 5; // Spacing between each layer

// Module to create a flat plate
module flat_plate() {
    cube([plate_width, plate_height, plate_thickness], center = true);
}

// Assemble the layers based on the graph_dict
module assembly() {
    // Layer 1: Topmost flat plate
    translate([0, 0, plate_spacing * 2.5]) flat_plate();
    
    // Layer 2: Second flat plate
    translate([0, 0, plate_spacing * 1.5]) flat_plate();
    
    // Layer 3: Third flat plate
    translate([0, 0, plate_spacing * 0.5]) flat_plate();
    
    // Layer 4: Fourth flat plate
    translate([0, 0, -plate_spacing * 0.5]) flat_plate();
    
    // Layer 5: Fifth flat plate
    translate([0, 0, -plate_spacing * 1.5]) flat_plate();
    
    // Layer 6: Bottommost flat plate
    translate([0, 0, -plate_spacing * 2.5]) flat_plate();
}

// Render the assembly
assembly();

