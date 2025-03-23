// Function to create a rectangular prism
module rectangular_prism(length, width, height) {
    cube([length, width, height], center=true);
}

// Adjusted dimensions for the rectangular prisms to match the original model
length = 100;  // Updated length of the prism
width = 10;    // Width of the prism remains the same
height = 5;    // Height of the prism remains the same

// Positions for the four rectangular prisms
translate([0, 0, 0]) rectangular_prism(length, width, height);  // Prism 1
translate([120, 0, 0]) rectangular_prism(length, width, height); // Prism 2
translate([0, 60, 0]) rectangular_prism(length, width, height); // Prism 3
translate([120, 60, 0]) rectangular_prism(length, width, height); // Prism 4
