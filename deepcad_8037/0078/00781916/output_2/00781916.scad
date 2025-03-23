
// Parameters
base_disk_radius = 20; // Radius of the base disk
base_disk_thickness = 2; // Reduced thickness of the base disk to match the original model
prong_width = 1.5; // Reduced width of each vertical prong for a slender shape
prong_depth = 10; // Depth of each vertical prong remains unchanged
prong_height = 30; // Increased height of each vertical prong to match the original model
num_prongs = 4; // Number of prongs remains unchanged
prong_spacing_angle = 360 / num_prongs; // Angle between prongs remains unchanged
slot_width = 3; // Width of the slots on the base disk
slot_depth = 1; // Depth of the slots on the base disk

// Base disk module with slots
module base_disk() {
    difference() {
        cylinder(h = base_disk_thickness, r = base_disk_radius, center = false);
        for (i = [0 : num_prongs - 1]) {
            rotate([0, 0, i * prong_spacing_angle]) {
                translate([base_disk_radius - slot_width / 2, 0, base_disk_thickness / 2]) {
                    cube([slot_width, slot_depth, base_disk_thickness], center = true);
                }
            }
        }
    }
}

// Vertical prong module
module vertical_prong() {
    cube([prong_width, prong_depth, prong_height], center = true);
}

// Assembly
module flexible_coupling() {
    // Layer 2: Base disk
    base_disk();

    // Layer 1: Vertical prongs
    for (i = [0 : num_prongs - 1]) {
        rotate([0, 0, i * prong_spacing_angle]) {
            translate([base_disk_radius - prong_depth / 2, 0, base_disk_thickness]) {
                vertical_prong();
            }
        }
    }
}

// Render the flexible coupling
flexible_coupling();

