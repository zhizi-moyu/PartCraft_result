
// Spacer Ring Parameters
module spacer_ring(outer_diameter=20, inner_diameter=15, thickness=1) { // Reduced thickness to match the original model
    difference() {
        // Outer cylinder
        cylinder(h=thickness, r=outer_diameter/2, center=true);
        // Inner cylinder (hole)
        cylinder(h=thickness + 1, r=inner_diameter/2, center=true);
    }
}

// Render the spacer ring
spacer_ring();

// Bolt Parameters
module bolt(length=12, diameter=3) { // Increased length to match the original model
    cylinder(h=length, r=diameter/2, center=true);
}

// Render the bolt
bolt();

// Central Shaft Parameters
module central_shaft(length=20, diameter=5) { // Reduced diameter to match the original model
    cylinder(h=length, r=diameter/2, center=true);
}

// Render the central shaft
central_shaft();

// Input Shaft Parameters
module input_shaft(length=15, base_diameter=4, taper_diameter=2) { // Increased taper to match the original model
    difference() {
        cylinder(h=length, r=base_diameter/2, center=true);
        translate([0, 0, length - 5]) // Taper starts 5 units from the end
            cylinder(h=5, r=taper_diameter/2, center=true);
    }
}

// Render the input shaft
input_shaft();

// Output Shaft Parameters
module output_shaft(length=25, base_diameter=4, taper_diameter=2) { // Increased length and taper to match the original model
    difference() {
        cylinder(h=length, r=base_diameter/2, center=true);
        translate([0, 0, length - 7]) // Taper starts 7 units from the end
            cylinder(h=7, r=taper_diameter/2, center=true);
    }
}

// Render the output shaft
output_shaft();

// Flange Plate Parameters
module flange_plate(diameter=30, thickness=1.5, bolt_holes=6) { // Reduced thickness and increased bolt holes to match the original model
    difference() {
        // Outer cylinder
        cylinder(h=thickness, r=diameter/2, center=true);
        // Bolt holes
        for (i = [0:bolt_holes-1]) {
            rotate([0, 0, i * 360/bolt_holes])
                translate([diameter/2 - 5, 0, 0])
                    cylinder(h=thickness + 1, r=1.5, center=true);
        }
    }
}

// Render the flange plate
flange_plate();

// Nut Parameters
module nut(size=3, thickness=2) { // Reduced hexagonal profile size to match the original model
    difference() {
        // Hexagonal profile
        rotate([0, 0, 30])
            linear_extrude(height=thickness)
                polygon(points=[[0, size], [size * cos(60), size * sin(60)], [-size * cos(60), size * sin(60)], [-size, 0], [-size * cos(60), -size * sin(60)], [size * cos(60), -size * sin(60)]]);
        // Hole
        cylinder(h=thickness + 1, r=size/2.5, center=true);
    }
}

// Render the nut
nut();

