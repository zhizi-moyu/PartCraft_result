
// Parameters
main_body_diameter = 20;
main_body_length = 40;
screw_diameter = 3;
screw_length = 5;
helical_cut_width = 3;
helical_cut_depth = 5;
num_helical_cuts = 4;
helical_spacing = main_body_length / (num_helical_cuts + 1);
helical_angle = 30; // Angle for helical cuts

// Main body with helical cuts
module main_body() {
    difference() {
        cylinder(d=main_body_diameter, h=main_body_length, center=true);
        
        // Helical cuts
        for (i = [0:num_helical_cuts-1]) {
            rotate([0, 0, i * (360 / num_helical_cuts)])
            translate([0, 0, -main_body_length/2 + (i + 1) * helical_spacing])
            rotate([0, 90, 0])
            rotate_extrude(angle=helical_angle)
            translate([main_body_diameter/2, 0, 0])
            square([helical_cut_width, helical_cut_depth], center=true);
        }
        
        // Clamping screw holes on flat circular faces
        for (z = [-main_body_length/2, main_body_length/2]) {
            translate([main_body_diameter/3, 0, z])
            rotate([90, 0, 0])
            cylinder(d=screw_diameter, h=screw_length, center=true);
            
            translate([-main_body_diameter/3, 0, z])
            rotate([90, 0, 0])
            cylinder(d=screw_diameter, h=screw_length, center=true);
        }
    }
}

// Clamping screw
module clamping_screw() {
    union() {
        cylinder(d=screw_diameter, h=screw_length, center=true);
        translate([0, 0, screw_length/2])
        cylinder(d=screw_diameter*1.5, h=screw_length/4, center=true);
    }
}

// Assemble the model
module flexible_coupling() {
    main_body();
    
    // Positioning the screws on the flat circular faces
    for (z = [-main_body_length/2, main_body_length/2]) {
        translate([main_body_diameter/3, 0, z])
        clamping_screw();
        
        translate([-main_body_diameter/3, 0, z])
        clamping_screw();
    }
}

// Render the model
flexible_coupling();

