
// Function to create a rectangular prism
module rectangular_prism(length, width, height) {
    cube([length, width, height], center=true);
}

// Function to create a cylindrical central craft
module central_craft(diameter, height) {
    cylinder(d=diameter, h=height, center=true, $fn=100); // Smooth cylindrical surface
}

// Function to create an input/output craft with a hollow center
module input_output_craft(outer_diameter, inner_diameter, height) {
    difference() {
        cylinder(d=outer_diameter, h=height, center=true, $fn=100); // Outer cylinder
        translate([0, 0, -0.1]) cylinder(d=inner_diameter, h=height + 0.2, center=true, $fn=100); // Hollow center
    }
}

// Function to create a spacer ring
module spacer_ring(outer_diameter, inner_diameter, thickness) {
    difference() {
        cylinder(d=outer_diameter, h=thickness, center=true, $fn=100); // Outer ring
        translate([0, 0, -0.1]) cylinder(d=inner_diameter, h=thickness + 0.2, center=true, $fn=100); // Inner hollow
    }
}

// Function to create a flange plate with bolt holes
module flange_plate(diameter, thickness, bolt_diameter, bolt_count) {
    difference() {
        cylinder(d=diameter, h=thickness, center=true, $fn=100); // Plate
        for (i = [0:bolt_count-1]) {
            angle = 360 / bolt_count * i;
            translate([diameter / 2 * 0.8 * cos(angle), diameter / 2 * 0.8 * sin(angle), 0])
                cylinder(d=bolt_diameter, h=thickness + 0.2, center=true, $fn=100); // Bolt holes
        }
    }
}

// Function to create a nut
module nut(size, thickness) {
    difference() {
        cylinder(d=size, h=thickness, center=true, $fn=6); // Hexagonal nut
        translate([0, 0, -0.1]) cylinder(d=size * 0.5, h=thickness + 0.2, center=true, $fn=100); // Hollow center
    }
}

// Function to create a bolt
module bolt(diameter, length, thread_length) {
    union() {
        cylinder(d=diameter, h=length, center=true, $fn=100); // Bolt body
        translate([0, 0, -length / 2]) cylinder(d=diameter * 0.8, h=thread_length, center=true, $fn=100); // Threaded end
    }
}

// Adjusted dimensions for the rectangular prisms to match the original model
length = 120;  // Updated length of the prism
width = 8;     // Reduced width of the prism
height = 4;    // Reduced height of the prism

// Positions for the four rectangular prisms
translate([0, 0, 0]) rectangular_prism(length, width, height);  // Prism 1
translate([140, 0, 0]) rectangular_prism(length, width, height); // Prism 2
translate([0, 80, 0]) rectangular_prism(length, width, height); // Prism 3
translate([140, 80, 0]) rectangular_prism(length, width, height); // Prism 4

// Central craft
translate([70, 40, 0]) central_craft(50, 100); // Adjusted diameter and height

// Input craft
translate([70, 20, 0]) input_output_craft(30, 15, 50); // Adjusted dimensions and hollow center

// Output craft
translate([70, 60, 0]) input_output_craft(30, 15, 50); // Adjusted dimensions and hollow center

// Spacer rings
translate([70, 40, -10]) spacer_ring(40, 30, 2); // Adjusted thickness and sharp edges

// Flange plates
translate([70, 40, -20]) flange_plate(60, 5, 5, 8); // Adjusted thickness and bolt holes

// Nuts
translate([70, 40, -25]) nut(10, 5); // Adjusted size and sharp edges

// Bolts
translate([70, 40, -30]) bolt(5, 50, 10); // Adjusted length and threading

