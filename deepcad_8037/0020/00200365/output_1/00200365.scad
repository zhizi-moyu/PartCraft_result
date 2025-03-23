
// Define the dimensions of the rectangular plate
module rectangular_plate(length, width, thickness) {
    // Adjusted thickness to match original model
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 1; // Thickness of the plate (reduced to match original model)

// Number of plates
num_plates = 6;

// Stack the plates uniformly in the same vertical alignment
for (i = [0 : num_plates - 1]) {
    translate([0, 0, i * plate_thickness])
        rectangular_plate(plate_length, plate_width, plate_thickness);
}

// Refinements for smooth edges and polished surface
module refined_plate(length, width, thickness) {
    // Adding fillet for smooth edges
    minkowski() {
        cube([length, width, thickness], center = true);
        sphere(0.5); // Small sphere for edge smoothing
    }
}

// Replace rectangular_plate with refined_plate for smoother edges
for (i = [0 : num_plates - 1]) {
    translate([0, 0, i * plate_thickness])
        refined_plate(plate_length, plate_width, plate_thickness);
}

// Ensure alignment and flatness
translate([0, 0, 0]) {
    for (i = [0 : num_plates - 1]) {
        translate([0, 0, i * plate_thickness])
            refined_plate(plate_length, plate_width, plate_thickness);
    }
}

