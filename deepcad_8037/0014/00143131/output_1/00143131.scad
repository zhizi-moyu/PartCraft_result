
// Central Cylinder
module central_cylinder() {
    cylinder(h = 30, r = 10, $fn = 100); // Height increased to 30 to match the elongated shape of the original model
}

// Spacer Ring
module spacer_ring() {
    difference() {
        cylinder(h = 2, r = 15, $fn = 100); // Reduced thickness to 2 to match the thinner profile of the original model
        cylinder(h = 2.1, r = 10, $fn = 100); // Inner cut to create the ring
    }
}

// Flange Plate
module flange_plate() {
    cylinder(h = 5, r = 20, $fn = 100); // Increased diameter to 20 to match the original model
}

// Nut
module nut() {
    difference() {
        cylinder(h = 5, r = 8, $fn = 6); // Hexagonal nut with sharper edges
        cylinder(h = 5.1, r = 4, $fn = 100); // Inner cut for the bolt
    }
}

// Bolt
module bolt() {
    cylinder(h = 25, r = 3, $fn = 100); // Increased length to 25 to match the original model
}

// Main Model
module model() {
    // Layer 1: Central Cylinder
    central_cylinder();
    
    // Layer 2: Spacer Ring
    translate([0, 0, 30]) spacer_ring(); // Positioned on top of the central cylinder
    
    // Layer 3: Flange Plate
    translate([0, 0, 32]) flange_plate(); // Positioned on top of the spacer ring
    
    // Layer 4: Nut
    translate([0, 0, 37]) nut(); // Positioned on top of the flange plate
    
    // Layer 5: Bolt
    translate([0, 0, 0]) bolt(); // Positioned through the entire assembly
}

// Render the model
model();

