
// Parameters
thickness = 5;  // Thickness of the bracket
long_arm_length = 50;
short_arm_length = 30;
height = 40;

// Module to create the L-bracket
module L_bracket() {
    // Base arm
    cube([long_arm_length, thickness, thickness]);

    // Vertical arm
    translate([0, 0, thickness])
        cube([thickness, thickness, height]);

    // Diagonal support
    translate([0, 0, thickness])
        linear_extrude(height=thickness)
        polygon(points=[[0, 0], [thickness, 0], [0, height]]);
}

// Render the L-bracket
L_bracket();

