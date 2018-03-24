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

module letter(l="C", size = 100) {
    translate([- letter_h / 2, size / 2 + letter_h / 2, -letter_h / 2]) 
        color("Purple")
        minkowski() {
            linear_extrude(height = letter_h)
                text(l, 
                 //size=size*22/30,
                 size=size,
                 font="Niconne",
                 halign="center",
                 valign="center"); 
            sphere(r=letter_h);
        }
}

module letter_with_hole(l = "L", size = 100, support = 10) {
    echo(l);
    difference() {
        letter(l = l, size = size);
        #translate([0, support - 3.5, 0])
            rotate([ 90, 0, 0]) {
                cylinder(d=support, h  = support);
            }
    }
}

// Unit Test
//chloe();
//lettre(letter = "L", size = size);
letter_with_hole(l="O");


