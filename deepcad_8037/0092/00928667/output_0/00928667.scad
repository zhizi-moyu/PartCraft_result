
// Parameters for components
hex_radius = 10; // Radius of the hexagonal prism
hex_height = 5;  // Height of the hexagonal prism
cube_size = 10;  // Side length of the cube

// Function to create a hexagonal prism
module hexagonal_component() {
    rotate([0, 0, 0])
    linear_extrude(height = hex_height)
    polygon(points = [
        [hex_radius * cos(0), hex_radius * sin(0)],
        [hex_radius * cos(60), hex_radius * sin(60)],
        [hex_radius * cos(120), hex_radius * sin(120)],
        [hex_radius * cos(180), hex_radius * sin(180)],
        [hex_radius * cos(240), hex_radius * sin(240)],
        [hex_radius * cos(300), hex_radius * sin(300)]
    ]);
}

// Function to create a cubic component
module cubic_component() {
    cube([cube_size, cube_size, cube_size], center = true);
}

// Assembly of the model
module assembly() {
    // Layer 1: Topmost layer with two hexagonal components
    translate([0, 15, 20]) hexagonal_component(); // Hexagonal component 1
    translate([0, -15, 20]) hexagonal_component(); // Hexagonal component 2

    // Layer 2: Middle layer with two hexagonal components
    translate([15, 0, 10]) hexagonal_component(); // Hexagonal component 3
    translate([-15, 0, 10]) hexagonal_component(); // Hexagonal component 4

    // Layer 3: Central cubic component
    translate([0, 0, 0]) cubic_component();

    // Layer 4: Bottommost layer with two hexagonal components
    translate([0, 15, -10]) hexagonal_component(); // Hexagonal component 5
    translate([0, -15, -10]) hexagonal_component(); // Hexagonal component 6
}

// Render the assembly
assembly();

