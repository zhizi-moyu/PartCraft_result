
// Function to create a single angled connector
module angled_connector() {
    // Base dimensions for the connector
    connector_length = 20;
    connector_width = 5;
    connector_height = 5;
    angle_offset = 10;

    // Create the "L" shape
    union() {
        // Horizontal part
        cube([connector_length, connector_width, connector_height]);

        // Vertical part
        translate([connector_length - angle_offset, 0, connector_height])
        rotate([0, -90, 0])
        cube([connector_length - angle_offset, connector_width, connector_height]);
    }
}

// Position and render all six angled connectors
module model() {
    // Define positions for the six connectors
    positions = [
        [0, 0, 0],
        [30, 0, 0],
        [60, 0, 0],
        [0, 30, 0],
        [30, 30, 0],
        [60, 30, 0]
    ];

    // Render each connector at its respective position
    for (pos = positions) {
        translate(pos)
        angled_connector();
    }
}

// Render the model
model();

