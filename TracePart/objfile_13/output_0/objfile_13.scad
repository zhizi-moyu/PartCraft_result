
// Parameters
hub_diameter = 30;
hub_length = 20;
shaft_hole_diameter = 10;
flexible_element_outer_diameter = 40;
flexible_element_inner_diameter = 28;
flexible_element_thickness = 10;
retaining_ring_thickness = 2;
screw_diameter = 3;
screw_length = 5;
num_screws = 3;
screw_spacing_radius = 15;

// Input Shaft Hub
module input_shaft_hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=shaft_hole_diameter, h=hub_length + 2, center=true);
    }
}

// Output Shaft Hub
module output_shaft_hub() {
    difference() {
        cylinder(d=hub_diameter, h=hub_length, center=true);
        cylinder(d=shaft_hole_diameter, h=hub_length + 2, center=true);
    }
}

// Flexible Element
module flexible_element() {
    difference() {
        cylinder(d=flexible_element_outer_diameter, h=flexible_element_thickness, center=true);
        cylinder(d=flexible_element_inner_diameter, h=flexible_element_thickness + 2, center=true);
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
    cylinder(d=screw_diameter, h=screw_length, center=true);
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

