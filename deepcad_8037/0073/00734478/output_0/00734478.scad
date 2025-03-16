
// Define parameters
long_rod_length = 100;
long_rod_diameter = 5;

short_rod_length = 50;
short_rod_diameter = 5;

offset = 10; // Offset between short rods
height_difference = 5; // Height difference between layers

// Module to create a cylindrical rod
module cylindrical_rod(length, diameter) {
    cylinder(h=length, d=diameter, center=false);
}

// Assemble the model
module model() {
    // Layer 1: Two short cylindrical rods
    translate([0, 0, height_difference])
        cylindrical_rod(short_rod_length, short_rod_diameter);
    
    translate([offset, 0, height_difference])
        cylindrical_rod(short_rod_length, short_rod_diameter);
    
    // Layer 2: Long cylindrical rod below the short rods
    translate([offset / 2, 0, 0])
        cylindrical_rod(long_rod_length, long_rod_diameter);
}

// Render the model
model();

