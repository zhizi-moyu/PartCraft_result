
// Define parameters for the flat square plates
plate_size = 50; // Length and width of the square plate
plate_thickness = 5; // Thickness of each plate
plate_spacing = 7; // Adjusted spacing between each plate in the vertical stack

// Function to create a flat square plate
module flat_square_plate() {
    cube([plate_size, plate_size, plate_thickness], center = true);
}

// Assemble the stack of flat square plates
module stacked_plates() {
    for (i = [0:5]) {
        translate([0, 0, i * (plate_thickness + plate_spacing)])
            flat_square_plate();
    }
}

// Render the model
stacked_plates();

