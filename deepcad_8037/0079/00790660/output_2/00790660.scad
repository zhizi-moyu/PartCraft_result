
// Parameters
thickness = 15;  // Increased thickness for stronger arms
long_arm_length = 40;  // Shortened to match the original proportions
short_arm_length = 25;
height = 35;  // Adjusted height for better proportion

// Module to create the L-bracket
module L_bracket() {
    // Base arm
    cube([long_arm_length, thickness, thickness]);

    // Vertical arm
    translate([0, 0, thickness])
        cube([thickness, thickness, height]);

    // Reinforced diagonal support repositioned and integrated
    translate([0, 0, thickness])
        linear_extrude(height=thickness)
        polygon(points=[[0, 0], [thickness, 0], [thickness, height], [0, height]]);
}

// Render the L-bracket
L_bracket();

