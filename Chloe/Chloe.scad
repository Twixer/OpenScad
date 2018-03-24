$fn = 50;
letter_h = 10;
size = 100;
support = 10;

// Font : Niconne
// Font Palatino Linotype
module chloe(letters = "CHLOE", size = 100) {
    colors = ["Purple", "DeepPink"];
    for (i= [0 : 1 : len(letters) - 1]) {
        echo(letters[i]);
        color(colors[i % 2])
        translate([i*size,0,0])
            linear_extrude(height = letter_h)
                text(letters[i], 
                 size=size*22/30,
                 font="Niconne",
                 halign="center",
                 valign="center");            
    }
}

module lettre(letter="C", size = 100) {
    translate([- letter_h / 2, size / 2 + letter_h / 2, -letter_h / 2]) 
        color("Purple")
        minkowski() {
            linear_extrude(height = letter_h)
                text(letter, 
                 //size=size*22/30,
                 size=size,
                 font="Niconne",
                 halign="center",
                 valign="center"); 
            sphere(r=letter_h);
        }
}

// Unit Test
//chloe();
//lettre(letter = "L", size = size);

//$dimensionDe = 40;
//$diametreMarquage = $dimensionDe + 0.3;
//$fn = 120;
//
difference() {
    lettre(letter = "L", size = size);
    translate([0, support - 2, 0])
        rotate([ 90, 0, 0]) {
            cylinder(d=support, h  = support);
        }
}

