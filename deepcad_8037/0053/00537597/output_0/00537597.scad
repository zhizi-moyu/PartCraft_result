
// Plate dimensions
plate_length = 100;
plate_width = 20;
plate_thickness = 5;
hole_diameter = 3;
hole_offset = 5;
num_plates = 6;
spacing = 2; // Spacing between plates

// Function to create a single plate with four holes
module plate() {
    difference() {
        cube([plate_length, plate_width, plate_thickness]);
        for (x = [hole_offset, plate_length - hole_offset]) {
            for (y = [hole_offset, plate_width - hole_offset]) {
                translate([x, y, -1]) 
                    cylinder(h=plate_thickness + 2, d=hole_diameter);
            }
        }
    }
}

// Stack the plates in layers
module stacked_plates() {
    for (i = [0:num_plates-1]) {
        translate([0, 0, i * (plate_thickness + spacing)])
            plate();
    }
}

// Render the model
stacked_plates();

