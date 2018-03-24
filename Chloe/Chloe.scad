letters = "CHLOE";
size = 100;

// translate ([0,0,0]) import ("heart.stl");

// Font : Niconne
// Font Palatino Linotype
for (i= [0 : 1 : len(letters) - 1]) {
    echo(letters[i]);
    translate([i*size,0,0])
        linear_extrude(height = 15)
            text(letters[i], 
             size=size*22/30,
             font="Niconne",
             halign="center",
             valign="center");            
}