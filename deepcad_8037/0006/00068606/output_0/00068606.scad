
// Lightning-shaped blade module
module lightning_shaped_blade() {
    linear_extrude(height = 5)  // Extrude the 2D profile to create a 3D shape
    polygon(points = [
        [0, 0], [10, 5], [5, 10], [15, 15], [10, 20], [20, 25], [0, 30]
    ]);
}

// Flat elongated piece module
module flat_elongated_piece(length = 40, width = 5, thickness = 2) {
    cube([length, width, thickness], center = true);
}

// Layer 1: Lightning-shaped blades
module layer_1() {
    translate([-15, 0, 0]) rotate([0, 0, 0]) lightning_shaped_blade();
    translate([15, 0, 0]) rotate([0, 0, 180]) lightning_shaped_blade();
}

// Layer 2: Flat elongated pieces
module layer_2() {
    translate([-20, -10, -5]) flat_elongated_piece();
    translate([20, -10, -5]) flat_elongated_piece();
    translate([-20, 10, -5]) flat_elongated_piece();
    translate([20, 10, -5]) flat_elongated_piece();
}

// Combine all layers to form the final model
module flexible_coupling() {
    layer_1();
    layer_2();
}

// Render the model
flexible_coupling();

