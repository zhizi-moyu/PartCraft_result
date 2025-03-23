
// Define the dimensions of the rectangular plate
module rectangular_plate(length, width, thickness) {
    // Adjusted thickness to match original model
    cube([length, width, thickness], center = true);
}

// Parameters for the rectangular plate
plate_length = 50;  // Length of the plate
plate_width = 30;   // Width of the plate
plate_thickness = 0.5; // Thickness of the plate (reduced to match original model)

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
        sphere(0.2); // Smaller sphere for edge smoothing to remove taper
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

// Adjust orientation to ensure plates are flat and aligned
rotate([0, 0, 0]) { // Remove any tilt or angular orientation
    for (i = [0 : num_plates - 1]) {
        translate([0, 0, i * plate_thickness])
            refined_plate(plate_length, plate_width, plate_thickness);
    }
}

// Adjust dimensions to match the original model's surface area
plate_length = 52;  // Increased length to match original model
plate_width = 32;   // Increased width to match original model

// Flatten any curvature along the edges
module flat_plate(length, width, thickness) {
    cube([length, width, thickness], center = true);
}

// Replace refined_plate with flat_plate to ensure flat edges
for (i = [0 : num_plates - 1]) {
    translate([0, 0, i * plate_thickness])
        flat_plate(plate_length, plate_width, plate_thickness);
}

// Adjust position to align plates vertically
translate([0, 0, 0]) {
    for (i = [0 : num_plates - 1]) {
        translate([0, 0, i * plate_thickness])
            flat_plate(plate_length, plate_width, plate_thickness);
    }
}

