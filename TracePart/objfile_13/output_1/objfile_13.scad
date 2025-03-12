
// Parameters
hub_diameter = 30;
hub_length = 18; // Shortened to match the original model
shaft_hole_diameter = 10;
flexible_element_outer_diameter = 40;
flexible_element_inner_diameter = 28;
flexible_element_thickness = 8; // Reduced thickness to better integrate with hubs
retaining_ring_thickness = 1.5; // Reduced thickness to make it more flush
screw_diameter = 3;
screw_length = 4; // Shortened to make screws less exposed
num_screws = 3;
screw_spacing_radius = 15;

// Input Shaft Hub
module input_shaft_hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=shaft_hole_diameter, h=hub_length + 2, center=true);
        translate([0, 0, hub_length / 2])
            cylinder(d=hub_diameter * 0.8, h=4, center=false); // Added smoother transition
    }
}

// Output Shaft Hub
module output_shaft_hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=shaft_hole_diameter, h=hub_length + 2, center=true);
        translate([0, 0, -hub_length / 2])
            cylinder(d=hub_diameter * 0.8, h=4, center=false); // Added smoother transition
    }
}

// Flexible Element
module flexible_element() {
    difference() {
        translate([0, 0, -flexible_element_thickness / 2])
            cylinder(d=flexible_element_outer_diameter, h=flexible_element_thickness, center=false);
        translate([0, 0, -flexible_element_thickness / 2 - 1])
            cylinder(d=flexible_element_inner_diameter, h=flexible_element_thickness + 2, center=false);
    }
}

// Retaining Ring
module retaining_ring() {
    difference() {
        cylinder(d=flexible_element_outer_diameter, h=retaining_ring_thickness, center=true);
        cylinder(d=flexible_element_inner_diameter, h=retaining_ring_thickness + 2, center=true);
    }
}

// Fastening Screws
module fastening_screw() {
    translate([0, 0, -screw_length / 2])
        cylinder(d=screw_diameter, h=screw_length, center=false);
}

// Assembly
module coupling_assembly() {
    translate([0, 0, -hub_length - flexible_element_thickness / 2])
        input_shaft_hub();
    
    translate([0, 0, hub_length + flexible_element_thickness / 2])
        output_shaft_hub();
    
    translate([0, 0, 0])
        flexible_element();
    
    translate([0, 0, -flexible_element_thickness / 2 - retaining_ring_thickness])
        retaining_ring();
    
    translate([0, 0, flexible_element_thickness / 2 + retaining_ring_thickness])
        retaining_ring();
    
    for (i = [0:num_screws-1]) {
        angle = i * 360 / num_screws;
        translate([screw_spacing_radius * cos(angle), screw_spacing_radius * sin(angle), -flexible_element_thickness / 2 - retaining_ring_thickness])
            fastening_screw();
        
        translate([screw_spacing_radius * cos(angle), screw_spacing_radius * sin(angle), flexible_element_thickness / 2 + retaining_ring_thickness])
            fastening_screw();
    }
}

// Render the coupling assembly
coupling_assembly();

