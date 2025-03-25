
// Define parameters for the components
module cylindrical_joint_A() {
    cylinder(h = 8, r = 8, $fn = 50); // Short cylinder with height 8 and radius 8
}

module wavy_block_B() {
    difference() {
        cube([32, 40, 12]); // Flat rectangular block
        // Add four rounded wave-like protrusions
        for (i = [0, 1, 2, 3]) {
            translate([(i * 8) + 4, 40, 6])
                rotate([0, 90, 0])
                cylinder(h = 14, r = 8, $fn = 100);
        }
    }
}

module long_cylindrical_connector_C() {
    cylinder(h = 32, r = 8, $fn = 50); // Longer cylinder with height 32 and radius 8
}

// Assemble the model based on the positional relationships
module flexible_coupling_model() {
    union() {
        // Layer 1 - Position cylindrical_joint_A
        translate([-4, 24, 12])
            cylindrical_joint_A();

        // Layer 2 - Create wavy_block_B
        translate([-16, 0, 0])
            wavy_block_B();

        // Layer 3 - Position the two long_cylindrical_connector_C components
        translate([16, 12, -32])
            rotate([90, 0, 0])
            long_cylindrical_connector_C();
        translate([16, -8, -32])
            rotate([90, 0, 0])
            long_cylindrical_connector_C();
    }
}

// Render the model
flexible_coupling_model();

