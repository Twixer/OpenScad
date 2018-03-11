letter = "4";
size = 100;

// translate ([0,0,0]) import ("heart.stl");

// Font : Niconne
// Font Palatino Linotype
linear_extrude(height = 15, center = true)
    text(letter, 
     size=size*22/30,
     font="Niconne",
     halign="center",
     valign="center");            