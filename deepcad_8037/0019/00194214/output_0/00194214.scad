
// Parameters for the wedge block
wedge_length = 40;  // Length of the rectangular base
wedge_width = 20;   // Width of the rectangular base
wedge_height = 20;  // Height of the wedge block
hole_diameter = 10; // Diameter of the circular through hole
hole_offset = 10;   // Distance of the hole from the slanted face

module wedge_block() {
    // Create the main wedge shape
    difference() {
        // Base wedge block
        polyhedron(
            points=[
                [0, 0, 0], // Bottom-left corner
                [wedge_length, 0, 0], // Bottom-right corner
                [wedge_length, wedge_width, 0], // Top-right corner
                [0, wedge_width, 0], // Top-left corner
                [0, 0, wedge_height], // Bottom-left corner (top face)
                [wedge_length, 0, wedge_height], // Bottom-right corner (top face)
                [wedge_length, wedge_width, wedge_height], // Top-right corner (top face)
                [0, wedge_width, wedge_height] // Top-left corner (top face)
            ],
            faces=[
                [0, 1, 5, 4], // Bottom face
                [1, 2, 6, 5], // Right face
                [2, 3, 7, 6], // Top face
                [3, 0, 4, 7], // Left face
                [4, 5, 6, 7], // Slanted face
                [0, 1, 2, 3]  // Base face
            ]
        );

        // Circular through hole
        translate([hole_offset, wedge_width / 2, wedge_height / 2])
            rotate([90, 0, 0])
            cylinder(r=hole_diameter / 2, h=wedge_length + 1, center=true);
    }
}

// Render the wedge block
wedge_block();

