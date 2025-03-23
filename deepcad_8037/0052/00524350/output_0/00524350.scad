
// Parameters for the rod
rod_length = 50; // Length of the rod
rod_radius = 2;  // Radius of the rod
taper_radius = 1.5; // Radius at the tapered middle section
taper_length = 10; // Length of the tapered section

// Parameters for the end caps
end_cap_radius = 3; // Radius of the end cap
end_cap_height = 5; // Height of the end cap

// Function to create a tapered rod
module tapered_rod() {
    difference() {
        // Main rod
        cylinder(h = rod_length, r1 = rod_radius, r2 = rod_radius, center = true);
        // Tapered section
        translate([0, 0, -rod_length / 2 + taper_length])
            cylinder(h = rod_length - 2 * taper_length, r1 = taper_radius, r2 = taper_radius, center = false);
    }
}

// Function to create an end cap
module end_cap() {
    union() {
        // Cylindrical base
        cylinder(h = end_cap_height, r = end_cap_radius, center = false);
        // Rounded dome
        translate([0, 0, end_cap_height])
            sphere(r = end_cap_radius);
    }
}

// Assemble the model
module flexible_coupling() {
    // Top end cap
    translate([0, 0, rod_length / 2])
        end_cap();
    // Rod
    tapered_rod();
    // Bottom end cap
    translate([0, 0, -rod_length / 2 - end_cap_height])
        end_cap();
}

// Render the flexible coupling
flexible_coupling();

