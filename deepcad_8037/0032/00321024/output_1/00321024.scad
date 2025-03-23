
// Define the dimensions for each component
module flat_plate() {
    cube([50, 50, 3], center = true); // Reduced thickness to match the original model
}

module l_shaped_connector() {
    difference() {
        union() {
            cube([50, 50, 8], center = true); // Thinned horizontal section
            translate([0, -25, -4]) cube([50, 25, 8], center = true); // Adjusted thickness
        }
        translate([-25, -25, -4]) polyhedron(
            points = [[0, 0, 0], [25, 0, 0], [0, 25, 0], [0, 0, 8], [25, 0, 8], [0, 25, 8]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        ); // Made the triangular cutout more prominent and deeper
    }
}

module inner_support() {
    difference() {
        cube([35, 35, 20], center = true); // Reduced base width
        translate([-17.5, -17.5, -10]) polyhedron(
            points = [[0, 0, 0], [17.5, 0, 0], [0, 17.5, 0], [0, 0, 20], [17.5, 0, 20], [0, 17.5, 20]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        ); // Enlarged and sharpened the triangular cutout
    }
}

module outer_support() {
    difference() {
        cube([55, 55, 18], center = true); // Reduced thickness
        translate([-27.5, -27.5, -9]) polyhedron(
            points = [[0, 0, 0], [27.5, 0, 0], [0, 27.5, 0], [0, 0, 18], [27.5, 0, 18], [0, 27.5, 18]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        ); // Enlarged the triangular cutout and made vertical sides more defined
    }
}

module reinforcement_block() {
    difference() {
        cube([28, 28, 8], center = true); // Slightly decreased overall size
        translate([-14, -14, -4]) cube([12, 12, 8], center = true); // Reduced prominence of the stepped design
    }
}

// Assemble the components based on the positional relationship
module assembly() {
    translate([0, 0, 50]) flat_plate();
    translate([0, 0, 35]) l_shaped_connector();
    translate([0, 0, 15]) inner_support();
    translate([0, 0, -5]) outer_support();
    translate([0, 0, -20]) reinforcement_block();
}

// Render the final assembly
assembly();

