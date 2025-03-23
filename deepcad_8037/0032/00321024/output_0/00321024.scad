
// Define the dimensions for each component
module flat_plate() {
    cube([50, 50, 5], center = true);
}

module l_shaped_connector() {
    difference() {
        union() {
            cube([50, 50, 10], center = true);
            translate([0, -25, -5]) cube([50, 25, 10], center = true);
        }
        translate([-25, -25, -5]) polyhedron(
            points = [[0, 0, 0], [25, 0, 0], [0, 25, 0], [0, 0, 10], [25, 0, 10], [0, 25, 10]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        );
    }
}

module inner_support() {
    difference() {
        cube([40, 40, 20], center = true);
        translate([-20, -20, -10]) polyhedron(
            points = [[0, 0, 0], [20, 0, 0], [0, 20, 0], [0, 0, 20], [20, 0, 20], [0, 20, 20]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        );
    }
}

module outer_support() {
    difference() {
        cube([60, 60, 20], center = true);
        translate([-30, -30, -10]) polyhedron(
            points = [[0, 0, 0], [30, 0, 0], [0, 30, 0], [0, 0, 20], [30, 0, 20], [0, 30, 20]],
            faces = [[0, 1, 2], [3, 4, 5], [0, 1, 4, 3], [1, 2, 5, 4], [2, 0, 3, 5]]
        );
    }
}

module reinforcement_block() {
    difference() {
        cube([30, 30, 10], center = true);
        translate([-15, -15, -5]) cube([15, 15, 10], center = true);
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

