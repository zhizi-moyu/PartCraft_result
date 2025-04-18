
// Function to create a rectangular hollow bar
module rectangular_hollow_bar(length, width, height, wall_thickness) {
    difference() {
        // Outer rectangular prism
        cube([length, width, height], center = true);
        // Inner hollow section
        translate([wall_thickness, wall_thickness, wall_thickness])
            cube([length - 2 * wall_thickness, width - 2 * wall_thickness, height - 2 * wall_thickness], center = true);
    }
}

// Parameters for the rectangular hollow bar
length = 100; // Length of the bar
width = 20;   // Width of the bar
height = 20;  // Height of the bar
wall_thickness = 2; // Thickness of the walls

// Positional offsets for stacking the bars
offset_z = 25; // Vertical offset between layers

// Layer 1
translate([0, 0, 5 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 2
translate([0, 0, 4 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 3
translate([0, 0, 3 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 4
translate([0, 0, 2 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 5
translate([0, 0, 1 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 6
translate([0, 0, 0 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

