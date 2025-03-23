
// Parameters for the central disk
disk_diameter = 20; // Diameter of the disk (adjust based on the images)
disk_thickness = 5; // Thickness of the disk (adjust based on the images)

// Central disk
module central_disk() {
    cylinder(d = disk_diameter, h = disk_thickness, center = true);
}

// Render the central disk
central_disk();

