
// Define dimensions for components
base_plate_length = 100;
base_plate_width = 60;
base_plate_thickness = 5;

vertical_plate_length = 60;
vertical_plate_height = 40;
vertical_plate_thickness = 5;

horizontal_plate_length = 100;
horizontal_plate_width = 40;
horizontal_plate_thickness = 5;

corner_connector_length = 10;
corner_connector_width = 10;
corner_connector_thickness = 5;

diagonal_support_length = 50;
diagonal_support_thickness = 5;

// Base Plate
module base_plate() {
    cube([base_plate_length, base_plate_width, base_plate_thickness]);
}

// Vertical Plate
module vertical_plate() {
    translate([base_plate_length / 2 - vertical_plate_thickness / 2, 0, base_plate_thickness])
    cube([vertical_plate_thickness, vertical_plate_length, vertical_plate_height]);
}

// Horizontal Plate
module horizontal_plate() {
    translate([0, vertical_plate_length, base_plate_thickness + vertical_plate_height])
    cube([horizontal_plate_length, horizontal_plate_thickness, horizontal_plate_width]);
}

// Corner Connector
module corner_connector() {
    cube([corner_connector_length, corner_connector_width, corner_connector_thickness]);
}

// Diagonal Support
module diagonal_support() {
    translate([base_plate_length / 2 - diagonal_support_thickness / 2, 0, base_plate_thickness])
    rotate([0, 45, 0])
    cube([diagonal_support_length, diagonal_support_thickness, diagonal_support_thickness]);
}

// Assemble the model
module flexible_coupling() {
    base_plate();
    vertical_plate();
    horizontal_plate();
    
    // Corner Connectors
    translate([0, 0, base_plate_thickness])
    corner_connector();
    translate([base_plate_length - corner_connector_length, 0, base_plate_thickness])
    corner_connector();
    
    // Diagonal Support
    diagonal_support();
}

// Render the model
flexible_coupling();

