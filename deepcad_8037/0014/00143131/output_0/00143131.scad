
// Central Cylinder
module central_cylinder() {
    cylinder(h = 20, r = 10, $fn = 100); // Height = 20, Radius = 10, Smooth surface
}

// Main Model
module model() {
    // Layer 1: Central Cylinder
    central_cylinder();
}

// Render the model
model();

