
// Parameters for the central disk
disk_diameter = 20; // Diameter of the disk (consistent with the original model)
disk_thickness = 3; // Adjusted thickness of the disk to match the original model

// Central disk
module central_disk() {
    cylinder(d = disk_diameter, h = disk_thickness, center = true);
}

// Render the central disk
central_disk();

