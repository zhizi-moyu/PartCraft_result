
// Parameters for the central shaft
shaft_length = 100; // Length of the shaft
outer_diameter = 20; // Outer diameter of the shaft
inner_diameter = 10; // Inner diameter (hollow center)

// Function to create the central shaft
module central_shaft() {
    // Adjusted to have a uniform cylindrical shape
    difference() {
        // Outer cylinder
        cylinder(h = shaft_length, d = outer_diameter, center = true);
        // Inner hollow cylinder
        cylinder(h = shaft_length, d = inner_diameter, center = true);
    }
}

// Parameters for the spacer ring
spacer_thickness = 2; // Thickness of the spacer ring
spacer_outer_diameter = 30; // Outer diameter of the spacer ring
spacer_inner_diameter = 20; // Inner diameter of the spacer ring

// Function to create the spacer ring
module spacer_ring() {
    // Adjusted to be thinner and flatter
    difference() {
        // Outer cylinder
        cylinder(h = spacer_thickness, d = spacer_outer_diameter, center = true);
        // Inner hollow cylinder
        cylinder(h = spacer_thickness + 1, d = spacer_inner_diameter, center = true);
    }
}

// Parameters for the flange plate
flange_thickness = 5; // Thickness of the flange plate
flange_outer_diameter = 50; // Outer diameter of the flange plate
flange_inner_diameter = 20; // Inner diameter of the flange plate
bolt_hole_diameter = 5; // Diameter of the bolt holes
num_bolt_holes = 6; // Number of bolt holes

// Function to create the flange plate
module flange_plate() {
    // Adjusted to have more bolt holes and a larger outer diameter
    difference() {
        // Outer cylinder
        cylinder(h = flange_thickness, d = flange_outer_diameter, center = true);
        // Inner hollow cylinder
        cylinder(h = flange_thickness + 1, d = flange_inner_diameter, center = true);
        // Bolt holes
        for (i = [0:num_bolt_holes-1]) {
            rotate([0, 0, i * 360 / num_bolt_holes])
                translate([flange_outer_diameter / 2 - 5, 0, 0])
                cylinder(h = flange_thickness + 2, d = bolt_hole_diameter, center = true);
        }
    }
}

// Parameters for the nut
nut_thickness = 5; // Thickness of the nut
nut_outer_diameter = 10; // Outer diameter of the nut
nut_inner_diameter = 5; // Inner diameter of the nut

// Function to create the nut
module nut() {
    // Adjusted to have a more compact hexagonal shape
    difference() {
        // Hexagonal prism
        rotate([0, 0, 30])
            linear_extrude(height = nut_thickness)
                polygon(points = [[-nut_outer_diameter / 2, 0], [0, nut_outer_diameter / 2], [nut_outer_diameter / 2, 0], [0, -nut_outer_diameter / 2]]);
        // Inner hollow cylinder
        cylinder(h = nut_thickness + 1, d = nut_inner_diameter, center = true);
    }
}

// Parameters for the bolt
bolt_length = 50; // Length of the bolt
bolt_head_diameter = 8; // Diameter of the bolt head
bolt_thread_diameter = 5; // Diameter of the bolt thread
bolt_thread_length = 40; // Length of the bolt thread

// Function to create the bolt
module bolt() {
    // Adjusted to have a longer threaded section and a smaller flat head
    union() {
        // Bolt head
        cylinder(h = bolt_length - bolt_thread_length, d = bolt_head_diameter, center = false);
        // Bolt thread
        translate([0, 0, bolt_length - bolt_thread_length])
            cylinder(h = bolt_thread_length, d = bolt_thread_diameter, center = false);
    }
}

// Render the components
central_shaft();
translate([0, 0, shaft_length / 2 + spacer_thickness / 2]) spacer_ring();
translate([0, 0, shaft_length / 2 + spacer_thickness + flange_thickness / 2]) flange_plate();
translate([0, 0, shaft_length / 2 + spacer_thickness + flange_thickness + nut_thickness / 2]) nut();
translate([0, 0, shaft_length / 2 + spacer_thickness + flange_thickness + nut_thickness + bolt_length / 2]) bolt();

