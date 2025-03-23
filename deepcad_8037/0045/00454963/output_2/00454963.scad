
// Key dimensions
key_length = 50;  // Length of the key
key_width = 5;    // Width of the key
key_height = 3;   // Height of the key

// Generate the key
module key() {
    // Create a sharp-edged rectangular prism to match the original model
    cube([key_length, key_width, key_height], center = true);
}

// Render the key
key();

