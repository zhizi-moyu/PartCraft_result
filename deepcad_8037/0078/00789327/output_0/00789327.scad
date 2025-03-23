
// Function to create a heart-shaped plate
module heart_shaped_plate(thickness) {
    difference() {
        // Create the heart shape using two circles and a square
        union() {
            translate([-10, 0, 0]) circle(10); // Left circle
            translate([10, 0, 0]) circle(10); // Right circle
            translate([-20, -20, 0]) square([40, 20]); // Bottom square
        }
        // Cut out the bottom triangle to form the heart shape
        translate([-20, -20, 0]) polygon(points=[[0, 0], [40, 0], [20, -30]]);
    }
    // Extrude the 2D heart shape to create a 3D plate
    linear_extrude(height=thickness) {
        difference() {
            union() {
                translate([-10, 0]) circle(10); // Left circle
                translate([10, 0]) circle(10); // Right circle
                translate([-20, -20]) square([40, 20]); // Bottom square
            }
            translate([-20, -20]) polygon(points=[[0, 0], [40, 0], [20, -30]]);
        }
    }
}

// Parameters
plate_thickness = 5; // Thickness of each heart-shaped plate
plate_spacing = 2;   // Spacing between each plate

// Generate the 6 heart-shaped plates in a stacked configuration
for (i = [0:5]) {
    translate([0, 0, i * (plate_thickness + plate_spacing)]) {
        heart_shaped_plate(plate_thickness);
    }
}

