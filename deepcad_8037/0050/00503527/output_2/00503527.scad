
// Define dimensions for each component
module long_hook_shaped_bar() {
    difference() {
        cube([100, 10, 10]); // Main bar
        translate([90, 0, 0]) rotate([0, 0, 90]) cube([15, 10, 10]); // Hook extended and made more pronounced
    }
}

module hook_shaped_bracket() {
    difference() {
        cube([80, 10, 10]); // Main bar
        translate([65, 0, 0]) rotate([0, 0, 90]) cube([15, 10, 10]); // Hook length extended to match original dimensions
    }
}

module flat_bar_with_small_bend() {
    union() {
        cube([70, 10, 10]); // Main bar
        translate([60, 0, 0]) rotate([0, 0, 2]) cube([10, 10, 10]); // Bend softened to form a gentle curve
    }
}

module angled_bar_with_notch() {
    difference() {
        union() {
            cube([60, 10, 10]); // Main bar
            translate([50, 0, 0]) rotate([0, 0, 20]) cube([10, 10, 10]); // Angled end adjusted to match original design
        }
        translate([55, 3.5, 0]) cube([2, 2, 10]); // Notch made shallower and more precise
    }
}

module straight_bar_with_bent_end() {
    union() {
        cube([50, 10, 10]); // Main bar
        translate([40, 0, 0]) rotate([0, 0, 5]) cube([10, 10, 10]); // Bent end reduced to form a subtler angle
    }
}

module short_straight_bar() {
    cube([40, 6, 10]); // Short straight bar with reduced thickness
}

// Assemble the model based on positional relationships
module flexible_coupling() {
    translate([0, 0, 50]) long_hook_shaped_bar(); // Layer 1
    translate([0, 0, 40]) hook_shaped_bracket(); // Layer 2
    translate([0, 0, 30]) flat_bar_with_small_bend(); // Layer 3
    translate([0, 0, 20]) angled_bar_with_notch(); // Layer 4
    translate([0, 0, 10]) straight_bar_with_bent_end(); // Layer 5
    translate([0, 0, 0]) short_straight_bar(); // Layer 6
}

// Render the model
flexible_coupling();

