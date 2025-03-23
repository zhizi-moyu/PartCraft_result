// Parameters
shaft_diameter = 12; // Updated diameter of shafts (input/output)
shaft_length = 40; // Length of input/output shafts
central_shaft_length = 70; // Updated length of central shaft
flange_diameter = 30; // Diameter of flange plates
flange_thickness = 5; // Thickness of flange plates
spacer_ring_diameter = 30; // Diameter of spacer rings
spacer_ring_thickness = 1.5; // Updated thickness of spacer rings
bolt_diameter = 3; // Diameter of bolts
bolt_length = 60; // Updated length of bolts
nut_diameter = 5; // Updated diameter of nuts
nut_thickness = 2.5; // Updated thickness of nuts
bolt_hole_radius = 12; // Radius of bolt hole circle

// Helper function to create a bolt hole pattern
module bolt_holes(num_holes, radius) {
    for (i = [0:num_holes-1]) {
        rotate([0, 0, i * 360 / num_holes])
        translate([radius, 0, 0])
        cylinder(r=bolt_diameter/2, h=flange_thickness + spacer_ring_thickness, center=true);
    }
}

// Input Shaft
translate([0, 0, shaft_length/2])
cylinder(r=shaft_diameter/2, h=shaft_length, center=true);

// Flange Plate 1
translate([0, 0, shaft_length + flange_thickness/2])
difference() {
    cylinder(r=flange_diameter/2, h=flange_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Spacer Ring 1
translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness/2])
difference() {
    cylinder(r=spacer_ring_diameter/2, h=spacer_ring_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Flange Plate 2
translate([0, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness/2])
difference() {
    cylinder(r=flange_diameter/2, h=flange_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Central Shaft
translate([0, 0, shaft_length + flange_thickness*2 + spacer_ring_thickness + central_shaft_length/2])
cylinder(r=shaft_diameter/2, h=central_shaft_length, center=true);

// Flange Plate 3
translate([0, 0, shaft_length + flange_thickness*2 + spacer_ring_thickness + central_shaft_length + flange_thickness/2])
difference() {
    cylinder(r=flange_diameter/2, h=flange_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Spacer Ring 2
translate([0, 0, shaft_length + flange_thickness*2 + spacer_ring_thickness + central_shaft_length + flange_thickness + spacer_ring_thickness/2])
difference() {
    cylinder(r=spacer_ring_diameter/2, h=spacer_ring_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Flange Plate 4
translate([0, 0, shaft_length + flange_thickness*2 + spacer_ring_thickness + central_shaft_length + flange_thickness*2 + spacer_ring_thickness/2])
difference() {
    cylinder(r=flange_diameter/2, h=flange_thickness, center=true);
    bolt_holes(6, bolt_hole_radius); // Updated number of bolt holes
}

// Output Shaft
translate([0, 0, shaft_length + flange_thickness*2 + spacer_ring_thickness + central_shaft_length + flange_thickness*2 + spacer_ring_thickness + shaft_length/2])
cylinder(r=shaft_diameter/2, h=shaft_length, center=true);

// Bolts
for (i = [0:5]) { // Updated number of bolts
    rotate([0, 0, i * 360 / 6])
    translate([bolt_hole_radius, 0, shaft_length + flange_thickness + spacer_ring_thickness/2])
    cylinder(r=bolt_diameter/2, h=bolt_length, center=true);
}

// Nuts
for (i = [0:5]) { // Updated number of nuts
    rotate([0, 0, i * 360 / 6])
    translate([bolt_hole_radius, 0, shaft_length + flange_thickness + spacer_ring_thickness + flange_thickness + nut_thickness/2])
    cylinder(r=nut_diameter/2, h=nut_thickness, center=true);
}
