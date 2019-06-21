// Written by Jordi Riera-Baburés <jrierab@gmail.com>
// ManetaNevera V1.0
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
H = 6;
W = 20;
L = 196;
S = 156;

// Variables - laterals
HL = 30;
WL = 2*H;

union() {
    // Base
    difference() {
        cube([W, L, H], false);
        union() {
            translate([W/2, 20, 0])
                cylinder(h = H, r1 = 3, r2 = 6);
            translate([W/2, L - 20, 0])
                cylinder(h = H, r1 = 3, r2 = 6);
            translate([0, 30, 0])
                cube([W, L - 60, H], false);
        }
    }

    // Laterals
    translate([0, 0, H])
        cube([W, WL, HL + H/2], false);
        
    translate([0, L - WL, H])
        cube([W, WL, HL + H/2], false);

    // Top
    difference() {
        translate([0, 0, HL + H])
            cube([W, L, H], false);
        union() {
            translate([W/2, 20, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, 46, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, 72, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, 98, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, L - 72, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, L - 46, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
            translate([W/2, L - 20, HL + H])
                cylinder(h = H, r1 = 6, r2 = 6);
        }
    }
}

