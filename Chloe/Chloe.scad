$fn = 50;
print_ratio = 1;
letter_h = 10 * print_ratio;
size = 100 * print_ratio;
support = 10 * print_ratio;

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
        if (l != "H") {
            #translate([0, support - 3.5, 0])
                rotate([ 90, 0, 0]) {
                    cylinder(d=support, h  = support);
                }
        } else { 
            #translate([3 * support, support - 3.5, 0])
                rotate([ 90, 0, 0]) {
                    cylinder(d=support, h  = support);
                } 
            #translate([-3.5 * support, support - 3.5, 0])
                rotate([ 90, 0, 0]) {
                    cylinder(d=support, h  = support);
                }                 
        }
    }
}

module generate_support(size_L = 10, size_l = 3, size_h = 1, support = 10) {
    union() {
        cube([size_l, size_L, size_H], center = true);
        rotate([0, 0, 90])
            cube([size_l, size_L, size_H], center = true);
        cylinder(d=support - 1, h=support);    
    }
}


// Unit Test
//chloe();
//lettre(letter = "L", size = size);

// Lettter
letter_with_hole(l="H");
// Support
generate_support(size_L = size * 0.70, size_l = letter_h * 1.3, support = support);

// Letter and support
//letter_with_hole(l="H");
//translate([3 * support, support - 20, 0])
//    rotate([ -90, 0, 0]) {
//        generate_support(size_L = size * 0.70, size_l = letter_h * 1.3, support = support);
//    }

   
