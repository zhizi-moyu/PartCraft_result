
// Key dimensions
key_length = 50;  // Length of the key
key_width = 10;   // Width of the key
key_height = 5;   // Height of the key

// Generate the key
module key() {
    cube([key_length, key_width, key_height], center = true);
}

// Render the key
key();

