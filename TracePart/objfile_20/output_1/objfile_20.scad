
// Parameters
shaft_length = 80; // Increased to match original model
shaft_diameter = 10;
hub_diameter = 22; // Adjusted for better cylindrical definition
hub_length = 18; // Increased for better hub shape
flange_diameter = 30;
flange_thickness = 4; // Adjusted for better alignment
spacer_thickness = 3; // Increased to match original model
bolt_hole_radius = 2;
bolt_radius = 2;
bolt_length = 22; // Increased for better fastening
nut_radius = 3;
nut_thickness = 4; // Adjusted for better nut definition
bolt_positions = 6; // Increased to match original model

// Function to create a flange plate
module flange_plate() {
    difference() {
        cylinder(h=flange_thickness, d=flange_diameter, center=true);
        cylinder(h=flange_thickness+1, d=shaft_diameter, center=true);
        for (i = [0:bolt_positions-1]) {
            angle = i * 360 / bolt_positions;
            translate([flange_diameter/2.5 * cos(angle), flange_diameter/2.5 * sin(angle), 0])
                cylinder(h=flange_thickness+1, r=bolt_hole_radius, center=true);
        }
    }
}

// Function to create a spacer ring
module spacer_ring() {
    difference() {
        cylinder(h=spacer_thickness, d=flange_diameter, center=true);
        cylinder(h=spacer_thickness+1, d=shaft_diameter, center=true);
    }
}

// Function to create a hub
module hub() {
    difference() {
        cylinder(h=hub_length, d=hub_diameter, center=true);
        cylinder(h=hub_length+1, d=shaft_diameter, center=true);
    }
}

// Function to create a bolt
module bolt() {
    cylinder(h=bolt_length, r=bolt_radius, center=true);
}

// Function to create a nut
module nut() {
    cylinder(h=nut_thickness, r=nut_radius, center=true);
}

// Function to create the central shaft
module central_shaft() {
    cylinder(h=shaft_length, d=shaft_diameter, center=true);
}

// Assembly
module flexible_coupling() {
    translate([0, 0, -shaft_length/2]) central_shaft();
    
    // Positioning hubs
    translate([0, 0, -shaft_length/2 - hub_length/2]) hub();
    translate([0, 0, shaft_length/2 + hub_length/2]) hub();
    
    // Positioning flange plates
    translate([0, 0, -shaft_length/2 - hub_length/2 - flange_thickness]) flange_plate();
    translate([0, 0, -shaft_length/2 - hub_length/2 - flange_thickness - spacer_thickness]) spacer_ring();
    translate([0, 0, -shaft_length/2 - hub_length/2 - flange_thickness*2 - spacer_thickness]) flange_plate();
    
    translate([0, 0, shaft_length/2 + hub_length/2 + flange_thickness]) flange_plate();
    translate([0, 0, shaft_length/2 + hub_length/2 + flange_thickness + spacer_thickness]) spacer_ring();
    translate([0, 0, shaft_length/2 + hub_length/2 + flange_thickness*2 + spacer_thickness]) flange_plate();
    
    // Positioning bolts and nuts
    for (i = [0:bolt_positions-1]) {
        angle = i * 360 / bolt_positions;
        translate([flange_diameter/2.5 * cos(angle), flange_diameter/2.5 * sin(angle), -shaft_length/2 - hub_length/2 - flange_thickness - spacer_thickness/2])
            rotate([90, 0, angle]) bolt();
        translate([flange_diameter/2.5 * cos(angle), flange_diameter/2.5 * sin(angle), shaft_length/2 + hub_length/2 + flange_thickness + spacer_thickness/2])
            rotate([90, 0, angle]) bolt();
        
        translate([flange_diameter/2.5 * cos(angle), flange_diameter/2.5 * sin(angle), -shaft_length/2 - hub_length/2 - flange_thickness*2 - spacer_thickness - nut_thickness])
            rotate([90, 0, angle]) nut();
        translate([flange_diameter/2.5 * cos(angle), flange_diameter/2.5 * sin(angle), shaft_length/2 + hub_length/2 + flange_thickness*2 + spacer_thickness + nut_thickness])
            rotate([90, 0, angle]) nut();
    }
}

// Render the model
flexible_coupling();

