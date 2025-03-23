
// Key dimensions
key_length = 50;  // Length of the key
key_width = 5;    // Width of the key (reduced thickness for refinement)
key_height = 3;   // Height of the key (reduced thickness for refinement)

// Generate the key
module key() {
    cube([key_length, key_width, key_height], center = true);
}

// Render the key
key();

