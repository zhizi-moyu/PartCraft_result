
// Function to create a rectangular prism
module rectangular_prism(length, width, height) {
    cube([length, width, height], center=true);
}

// Dimensions for the rectangular prisms
length = 50;  // Length of the prism
width = 10;   // Width of the prism
height = 5;   // Height of the prism

// Positions for the six rectangular prisms
translate([0, 0, 0]) rectangular_prism(length, width, height);  // Prism 1
translate([60, 0, 0]) rectangular_prism(length, width, height); // Prism 2
translate([120, 0, 0]) rectangular_prism(length, width, height); // Prism 3
translate([0, 60, 0]) rectangular_prism(length, width, height); // Prism 4
translate([60, 60, 0]) rectangular_prism(length, width, height); // Prism 5
translate([120, 60, 0]) rectangular_prism(length, width, height); // Prism 6

