// Written by Jordi Riera-Babures <jrierab@gmail.com>
// Parasol for Pi Cam enclosure V1.0 - Parameterisized for Customizer
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

// Length of the enclosure (mm)
Top_Length = 28;          // [10:50]
// Width of the enclosure (mm)
Top_Width = 10;           // [5:20]
// Length of the hole (mm)
Hole_Length = 10;         // [1:50]
// Width of the hole (mm)
Hole_Width = 4;           // [1:20]
// Wall of the parasol (mm)
Parasol_wall = 9;        // [0:20]
// Length of the parasol (mm)
Parasol_Length = 15;      // [5:30]
// Angle of the parasol (mm)
Parasol_Angle = -10;      // [-30:30]

// Wall thickness (mm)
Wall_Thickness = 1;       // [1:5]


difference() {
    cube([Top_Length, Top_Width, Wall_Thickness]);
    translate([(Top_Length - Hole_Length)/2, 0, 0])
        cube([Hole_Length, Hole_Width, Wall_Thickness]);
}
translate([0, -Wall_Thickness, 0])
    cube([Top_Length, Wall_Thickness, Parasol_wall]);

translate([0, -Parasol_Length, Parasol_wall + Parasol_Length*sin(Parasol_Angle) + Wall_Thickness])
    mirror(v=[0,0,1]) rotate([Parasol_Angle, 0, 0])
    color("red") cube([Top_Length, Parasol_Length, Wall_Thickness]);

