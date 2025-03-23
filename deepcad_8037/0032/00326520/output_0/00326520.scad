
// Parameters for the hook-shaped rod
rod_diameter = 2; // Diameter of the rod
rod_length = 50;  // Length of the straight section
hook_radius = 10; // Radius of the hook
hook_angle = 180; // Angle of the hook curve

// Function to create a single hook-shaped rod
module hook_shaped_rod() {
    // Straight section of the rod
    translate([0, 0, rod_length / 2])
        cylinder(h = rod_length, r = rod_diameter / 2, center = true);

    // Hook section of the rod
    translate([0, 0, rod_length])
        rotate([0, 90, 0])
        rotate_extrude(angle = hook_angle)
            translate([hook_radius, 0, 0])
                circle(r = rod_diameter / 2);
}

// Generate all six hook-shaped rods
for (i = [0:5]) {
    rotate([0, 0, i * 60]) // Rotate each rod by 60 degrees around the Z-axis
        hook_shaped_rod();
}

