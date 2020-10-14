
use <fontmetrics.scad>;

// functions to back calculate even numbers of threads for walls (makes printing smoother)
// put your printer nozzle diameter and your chosen layer height below
nozzle_diameter = 0.2;
layer_height = 0.1;

pi=3.1415926535897932384626433832795;
function thread_width(Nd=nozzle_diameter,h=layer_height) = Nd + h;
function build_width(w=thread_w,h=layer_height) = w - h*(1-pi/4);
function threads(count,w=thread_w,wb=build_w) = w+wb*(count-1);
function ceil_threads(dim,w=thread_w,wb=build_w) =  ceil((dim-w)/wb);
function floor_threads(dim,w=thread_w,wb=build_w) =  floor((dim-w)/wb);
function floor_even(n) = floor(n/2)*2;

echo("THREAD PARAMETERS");
thread_w = thread_width(); 
echo(thread_w=thread_w);
build_w = build_width(); 
echo(build_w=build_w);


word="Clara"; //thing you want to cut out

//font = "Liberation Sans Narrow:style=Bold";
//font="Courier New:style=Bold Italic";
font="Webdings";
size=18; //size of the font


base=5; // number of layers in baseplate
wall=threads(2); // size of the walls must be set to less than the number of perimeters you want to use
n=5; // the number holes in the grid
height=10; // the height of the letters


// to get a sensible backing length for words use Mr Pruss's fontmetrics
w= measureText(word, font=font, size=size);
h= ascender(font=font,size=size)-descender(font=font,size=size);

//if you don't want to use fontmetrics then use the h and w below
//w=size;
//h=size*5/4;

base_depth=h;

d=(base_depth-((n+1)*2*wall))/n;
s=d+2*wall;
base_width=ceil(w/s)*s+2*wall;


rotate([0,180,0]){
difference(){
translate([0,-0,height/2+base*layer_height/2])cube([base_width,base_depth,base*layer_height],center=true);
                      translate([wall,wall,0]){
                         for(i=[-base_width/2+s/2:s:base_width/2-s/2]){
                            for(j=[-base_depth/2+s/2:s:base_depth/2-s/2]){
                                    translate([i,j,0])rotate([0,0,45])cylinder(d=d/cos(45),h=height,$fn=4);
                            }
                        }
                      }

}

    translate([0,0,layer_height*(base-2)]){ //embedd the letters in the baseplate
        linear_extrude(height=height,center=true,convexivity=10,scale=1)text(word,halign="center",valign="center",size=size,font=font);
}
}
