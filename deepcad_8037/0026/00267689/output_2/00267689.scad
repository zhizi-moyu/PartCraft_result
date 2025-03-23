
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
length = 150; // Adjusted length to match the original model
width = 20;   // Width of the bar
height = 20;  // Height of the bar
wall_thickness = 2; // Adjusted wall thickness to make the hollow interior wider

// Positional offsets for stacking the bars
offset_z = 25; // Vertical offset between layers
offset_y = 0;  // Horizontal offset to ensure uniform spacing

// Layer 1
translate([0, offset_y, 5 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 2
translate([0, offset_y, 4 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 3
translate([0, offset_y, 3 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 4
translate([0, offset_y, 2 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 5
translate([0, offset_y, 1 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

// Layer 6
translate([0, offset_y, 0 * offset_z])
    rectangular_hollow_bar(length, width, height, wall_thickness);

