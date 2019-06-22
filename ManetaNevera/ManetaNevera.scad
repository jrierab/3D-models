// Written by Jordi Riera-Baburés <jrierab@gmail.com>
// ManetaNevera V1.1 - Rounded corners + extension + double column
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.



// Variables - base
H = 6;      // Height - Z
W = 12;     // Width - X
L = 196;    // Length - Y  
// S = 156;

// Variables - Top
WT = 14;    // Width - X
R = 4;      // Hole radius
C = 2;      // Rounded corners radius
O = 20;     // Total overhead (past the columns)
D = (WT - W) /2;    // Translation adjust to correct width differences between base/top

// Variables - laterals
HL = 10;    // Height - Z
WL = 2*H;   // Width - X

union() {
    // Base - cube with holes
    difference() {
        cube([W, L, H], false);
        union() {
            translate([W/2, 20, 0])
                cylinder(h = H-0.1, r1 = 2, r2 = 4);
            translate([W/2, L - 20, 0])
                cylinder(h = H-0.1, r1 = 2, r2 = 4);
            translate([0, 40, 0])
                cube([W, L - 80, H], false);
        }
    }

    // Laterals - columns
    translate([0, 0, H])
        cube([W, WL, HL], false);
    
    translate([0, 40 - WL, H])
        cube([W, WL, HL], false);
        
    translate([0, L - WL, H])
        cube([W, WL, HL], false);
    
    translate([0, L - 40, H])
        cube([W, WL, HL], false);

    // Top - rounded cube with decoration holes
    difference() {
        translate([-C-D, -C-O, HL + H])
            roundedcube_simple([WT+2*C, L+2*C+2*O, H], false, C);
        union() {
            translate([WT/2-D, 20, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
            
            translate([WT/2-D, 46, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
            translate([WT/2-D, 72, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
            translate([WT/2-D, 98, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
            translate([WT/2-D, L - 72, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
            translate([WT/2-D, L - 46, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
         
            translate([WT/2-D, L - 20, HL + H])
                cylinder(h = H, r1 = R, r2 = R);
        }
    }
}

// https://gist.github.com/groovenectar/292db1688b79efd6ce11
module roundedcube_simple(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}
