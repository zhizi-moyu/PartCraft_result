
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
        // Position cylindrical_joint_A perpendicularly to the side of wavy_block_B
        translate([-8, -6, 6])
            rotate([0, 90, 0])
            cylindrical_joint_A();

        // Create wavy_block_B
        translate([-16, 0, 0])
            wavy_block_B();

        // Position two long_cylindrical_connector_C pieces symmetrically and attach them to opposing sides of wavy_block_B
        translate([0, -8, 6])
            rotate([0, 90, 0])
            long_cylindrical_connector_C();
        translate([0, 48, 6])
            rotate([0, 90, 0])
            long_cylindrical_connector_C();
    }
}

// Render the model
flexible_coupling_model();

