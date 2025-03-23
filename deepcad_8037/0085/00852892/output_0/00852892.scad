
// Define the dimensions of the flat plate
module flat_plate(length = 50, width = 30, thickness = 2) {
    cube([length, width, thickness], center = true);
}

// Generate the 3D model
// Since the component_list specifies 6 flat plates, we will create 6 identical plates
// and arrange them in a simple stack for visualization.

module flexible_coupling() {
    for (i = [0:5]) {
        translate([0, 0, i * 3]) // Stack plates with a 1mm gap between them
            flat_plate();
    }
}

// Call the main module to render the model
flexible_coupling();

