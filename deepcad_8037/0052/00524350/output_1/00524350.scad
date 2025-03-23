
// Parameters for the rod
rod_length = 55; // Adjusted length of the rod to match the original model
rod_radius = 2;  // Radius of the rod
taper_radius = 1.8; // Reduced taper radius to make it less pronounced
taper_length = 8; // Adjusted length of the tapered section

// Parameters for the end caps
end_cap_radius = 3; // Radius of the end cap
end_cap_height = 4; // Reduced height of the end cap to flatten the dome

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
        // Flattened dome
        translate([0, 0, end_cap_height])
            sphere(r = end_cap_radius * 0.8); // Flattened dome by reducing the sphere radius
    }
}

// Assemble the model
module flexible_coupling() {
    // Top end cap
    translate([0, 0, rod_length / 2 + end_cap_height / 2])
        end_cap();
    // Rod
    tapered_rod();
    // Bottom end cap
    translate([0, 0, -rod_length / 2 - end_cap_height / 2])
        end_cap();
}

// Render the flexible coupling
flexible_coupling();

