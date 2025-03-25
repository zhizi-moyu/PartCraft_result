
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
    // Attach cylindrical_joint_A to the first wave-like protrusion
    translate([4, 40, 6]) {
        rotate([0, 90, 0])
            cylindrical_joint_A();
    }
}

module long_cylindrical_connector_C() {
    cylinder(h = 32, r = 8, $fn = 50); // Longer cylinder with height 32 and radius 8
}

// Assemble the model based on the positional relationships
module flexible_coupling_model() {
    union() {
        // Create wavy_block_B with cylindrical_joint_A attached
        translate([-16, 0, 0])
            wavy_block_B();

        // Position one long_cylindrical_connector_C perpendicularly to the flat side of wavy_block_B
        translate([16, 12, 6])
            rotate([90, 0, 0])
            long_cylindrical_connector_C();
        
        // Position another long_cylindrical_connector_C horizontally attached to the attached cylindrical_joint_A
        translate([-12, 36, 14]) 
            long_cylindrical_connector_C();
    }
}

// Render the model
flexible_coupling_model();

