// Define the dimensions for the components based on the description

// Cylindrical Base Parameters
cylinder_diameter = 20;    // Diameter of the cylinder
cylinder_height = 30;      // Height of the cylinder

// Rectangular Extrusion Parameters
extrusion_width = 10;      // Width of the rectangular extrusion
extrusion_length = 10;     // Length of the rectangular extrusion
extrusion_height = 20;     // Height of the rectangular extrusion

// Generate the 3D model

module cylindrical_base() {
    cylinder(d=cylinder_diameter, h=cylinder_height); // Create the cylindrical base
}

module rectangular_extrusion() {
    translate([-(extrusion_width / 2), -(extrusion_length / 2), -extrusion_height])
        cube([extrusion_width, extrusion_length, extrusion_height]); // Create the rectangular extrusion and position it at the bottom center of the cylinder
}

// Assemble the model
cylindrical_base(); // Render the cylindrical base
rectangular_extrusion(); // Attach the rectangular extrusion at the bottom center of the cylindrical base
