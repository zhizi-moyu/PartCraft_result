module link_plate() {
    // Dimensions
    plate_length = 50; // Length of the plate
    plate_width = 15;  // Width of the plate
    plate_thickness = 5; // Thickness of the plate
    hole_diameter = 6; // Diameter of the holes
    hole_offset = 10; // Distance from the center of the holes to the ends of the plate

    // Create the main body of the plate
    difference() {
        // Rounded rectangle
        hull() {
            translate([0, 0, 0]) 
                cylinder(r=plate_width/2, h=plate_thickness);
            translate([plate_length, 0, 0]) 
                cylinder(r=plate_width/2, h=plate_thickness);
        }
        // Subtract holes
        translate([hole_offset, 0, plate_thickness/2])
            rotate([90, 0, 0])
                cylinder(r=hole_diameter/2, h=plate_width+1);
        translate([plate_length - hole_offset, 0, plate_thickness/2])
            rotate([90, 0, 0])
                cylinder(r=hole_diameter/2, h=plate_width+1);
    }
}

// Render the link plate
link_plate();
