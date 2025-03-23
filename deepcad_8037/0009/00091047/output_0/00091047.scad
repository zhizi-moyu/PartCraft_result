
// Dimensions
base_plate_length = 100;
base_plate_width = 60;
base_plate_thickness = 5;

vertical_plate_length = 60;
vertical_plate_height = 40;
vertical_plate_thickness = 5;

horizontal_plate_length = 100;
horizontal_plate_width = 40;
horizontal_plate_thickness = 5;

corner_connector_length = 40;
corner_connector_height = 40;
corner_connector_thickness = 5;

// Base Plate
module base_plate() {
    cube([base_plate_length, base_plate_width, base_plate_thickness], center = false);
}

// Vertical Plate
module vertical_plate() {
    translate([0, (base_plate_width - vertical_plate_thickness) / 2, base_plate_thickness])
        cube([vertical_plate_thickness, vertical_plate_length, vertical_plate_height], center = false);
}

// Horizontal Plate
module horizontal_plate() {
    translate([0, 0, base_plate_thickness + vertical_plate_height])
        cube([horizontal_plate_length, horizontal_plate_width, horizontal_plate_thickness], center = false);
}

// Corner Connector
module corner_connector() {
    translate([0, 0, base_plate_thickness])
        linear_extrude(height = corner_connector_thickness)
            polygon(points = [[0, 0], [corner_connector_length, 0], [0, corner_connector_height]]);
}

// Assembly
module assembly() {
    // Base Plate
    base_plate();

    // Vertical Plate
    vertical_plate();

    // Horizontal Plate
    horizontal_plate();

    // Corner Connectors
    translate([0, 0, base_plate_thickness])
        corner_connector();
    translate([horizontal_plate_length - corner_connector_length, 0, base_plate_thickness])
        corner_connector();
}

// Render the model
assembly();

