
// Function to create a single angled connector
module angled_connector() {
    // Base dimensions for the connector
    connector_length = 20;
    connector_width = 5;
    connector_height = 5;
    angle_offset = 10;

    // Create the "L" shape with corrected alignment and sharper bend
    union() {
        // Horizontal part
        cube([connector_length, connector_width, connector_height]);

        // Vertical part with sharper bend and proper alignment
        translate([connector_length - connector_width, 0, connector_height])
        rotate([0, 90, 0]) // Corrected rotation for sharper bend
        cube([connector_length - angle_offset, connector_width, connector_height]);
    }
}

// Position and render all six angled connectors
module model() {
    // Define corrected positions for the six connectors
    positions = [
        [0, 0, 0],
        [25, 0, 0], // Adjusted spacing for uniformity
        [50, 0, 0], // Adjusted spacing for uniformity
        [0, 25, 0], // Adjusted spacing for uniformity
        [25, 25, 0], // Adjusted spacing for uniformity
        [50, 25, 0]  // Adjusted spacing for uniformity
    ];

    // Render each connector at its respective position
    for (pos = positions) {
        translate(pos)
        angled_connector();
    }
}

// Render the model
model();

