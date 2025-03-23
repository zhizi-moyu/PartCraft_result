
// Dimensions for components
plate_length = 50; // Length of the rectangular plates
plate_width = 30;  // Width of the rectangular plates
plate_thickness = 5; // Thickness of the flat rectangular plates
beveled_plate_thickness = 3; // Thickness of the thin rectangular plates with beveled edges
bevel_size = 5; // Size of the bevel on the beveled plates

// Function to create a flat rectangular plate
module flat_rectangular_plate() {
    cube([plate_length, plate_width, plate_thickness], center = true);
}

// Function to create a thin rectangular plate with beveled edges
module thin_rectangular_plate_with_beveled_edges() {
    difference() {
        cube([plate_length, plate_width, beveled_plate_thickness], center = true);
        translate([-plate_length/2, -plate_width/2, 0])
            hull() {
                translate([0, 0, 0])
                    cube([bevel_size, plate_width, beveled_plate_thickness], center = false);
                translate([plate_length - bevel_size, 0, 0])
                    cube([bevel_size, plate_width, beveled_plate_thickness], center = false);
            }
    }
}

// Assembling the layers based on the graph_dict
module flexible_coupling() {
    // Layer 1: Thin rectangular plate with beveled edges
    translate([0, 0, plate_thickness * 2 + beveled_plate_thickness])
        thin_rectangular_plate_with_beveled_edges();

    // Layer 2: Flat rectangular plate
    translate([0, 0, plate_thickness + beveled_plate_thickness])
        flat_rectangular_plate();

    // Layer 3: Flat rectangular plate
    translate([0, 0, beveled_plate_thickness])
        flat_rectangular_plate();

    // Layer 4: Thin rectangular plate with beveled edges
    translate([0, 0, -plate_thickness])
        thin_rectangular_plate_with_beveled_edges();

    // Layer 5: Flat rectangular plate
    translate([0, 0, -plate_thickness * 2 - beveled_plate_thickness])
        flat_rectangular_plate();

    // Layer 6: Flat rectangular plate
    translate([0, 0, -plate_thickness * 3 - beveled_plate_thickness])
        flat_rectangular_plate();
}

// Render the flexible coupling
flexible_coupling();

