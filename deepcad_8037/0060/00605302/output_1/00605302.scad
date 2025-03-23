
// Define dimensions
cube_size = 20; // Size of the cube
rect_prism_width = 20; // Width of the rectangular prism
rect_prism_depth = 20; // Depth of the rectangular prism
rect_prism_height = 40; // Height of the rectangular prism

// Layer 1: Cube 1 (Topmost position)
translate([0, 0, rect_prism_height * 4 + cube_size]) {
    cube([cube_size, cube_size, cube_size]);
}

// Layer 2: Rectangular Prism 1 (Below Cube 1)
translate([0, 0, rect_prism_height * 3]) {
    cube([rect_prism_width, rect_prism_depth, rect_prism_height]);
}

// Layer 3: Rectangular Prism 2 (Below Rectangular Prism 1)
translate([0, 0, rect_prism_height * 2]) {
    cube([rect_prism_width, rect_prism_depth, rect_prism_height]);
}

// Layer 4: Rectangular Prism 3 (Below Rectangular Prism 2)
translate([0, 0, rect_prism_height]) {
    cube([rect_prism_width, rect_prism_depth, rect_prism_height]);
}

// Layer 5: Rectangular Prism 4 (Below Rectangular Prism 3)
translate([0, 0, 0]) {
    cube([rect_prism_width, rect_prism_depth, rect_prism_height]);
}

// Layer 6: Cube 2 (Bottommost position)
translate([0, 0, -cube_size]) {
    cube([cube_size, cube_size, cube_size]);
}

