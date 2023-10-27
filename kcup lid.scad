// Parameters //
// grid(x/y) is gridfinity grids
gridx = 5;
gridy = 4;
// hole(x/y) is kcup quantity
holex = 4;
holey = 2;


/* [Advance Variables] */
cube_length = gridx*42; 
cube_width = gridy*42;   
cube_thickness = 3; 

sc_offset = 2.15;
sc_height = 2.7 ;
hollow_offset = 2 * sc_offset;

sc_length = cube_length - sc_offset; //small cube
sc_width = cube_width - sc_offset;   
sc_thickness = cube_thickness - sc_offset; 


cylinder_diameter = 45.5; // Diameter of the cylinders
cylinder_height = cube_thickness; // Height of the cylinders, same as cube thickness
cylinder_spacing = 5.5; // Spacing between the cylinders
cylinder_count_x = holex; // Number of cylinders in the X direction
cylinder_count_y = holey; // Number of cylinders in the Y direction
cylinder_offset = 6; // Offset from the cube's sides



// Calculate spacing needed inside the cube
spacing_x = (cube_length - 2 * cylinder_offset - cylinder_diameter) / (cylinder_count_x - 1);
spacing_y = (cube_width - 2 * cylinder_offset - cylinder_diameter) / (cylinder_count_y - 1);

// Create the main cube


 
difference()  {
    
    union(){
    cube([cube_length,cube_width, cube_thickness]); // big boi
        union(){
          difference()  {
            translate([sc_offset,sc_offset,cube_thickness])
             cube([cube_length - 2*sc_offset,cube_width - 2*sc_offset, sc_height]); // small boi
                 
             translate([hollow_offset,hollow_offset,cube_thickness]) 
             cube([cube_length - 2*hollow_offset,cube_width - 2*hollow_offset, sc_height]);
                        }
               }  
           }
      
     // Create a grid of cylinders
     for (i = [0:cylinder_count_x - 1]) {
        for (j = [0:cylinder_count_y - 1]) {
            x = i * spacing_x + cylinder_offset + cylinder_diameter / 2;
            y = j * spacing_y + cylinder_offset + cylinder_diameter / 2;
            translate([x, y, 0])
            cylinder(cube_thickness+sc_height, cylinder_diameter / 2, cylinder_diameter / 2);
        

        
                                            }
   
                                         } 
              }
              
