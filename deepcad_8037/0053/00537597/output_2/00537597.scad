
// Plate dimensions
plate_length = 100;
plate_width = 20;
plate_thickness = 2; // Reduced thickness to match the original model
hole_diameter = 3;
hole_offset = 5;

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

// Render a single plate (removed stacking)
plate();

