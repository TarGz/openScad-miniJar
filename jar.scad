
$fa = 2;
external_width = 35.5;
internal_width = 31.5;

hexHeight = 11;


module internal(){
	translate([0,0,-100.5]) cylinder(169,internal_width,internal_width,false);
}

module lips(){
	translate([61.5,0,0]) cylinder(1,31.5,31.5,false);
}


module jar(){

	 // MAIN 
	difference(){
		translate([0,0,0]) cylinder(68,33.5,33.5,false);
		internal();
	}


	// VIS LIPS
	intersection(){
		internal();
		union(){
			rotate([0,0,00]) lips();
			rotate([0,0,90]) lips();
			rotate([0,0,180]) lips();
			rotate([0,0,270]) lips();
		}
	}

}

module branch(){
	twist = 22.5;
	translate([0, 0, 0])
		linear_extrude(height = hexHeight, center = false, convexity = 10, twist = 0, $fn = 100)
			translate([33.5, 0, 0])
				rotate([0,0,50]) circle(2.5, $fn=4);
	translate([0, 0, hexHeight])
		linear_extrude(height = hexHeight, center = false, convexity = 10, twist = twist, $fn = 100)
			translate([33.5, 0, 0])
				rotate([0,0,50]) circle(2.5, $fn=4);
	translate([0, 0, hexHeight])
		linear_extrude(height = hexHeight, center = false, convexity = 10, twist = -twist, $fn = 100)
			translate([33.5, 0, 0])
				rotate([0,0,50]) circle(2.5, $fn=4);
}

module branch3(){
	render(){
		twist = 45;
		hexHeight = 65;
		translate([0, 0, 2])
			linear_extrude(height = hexHeight, center = false, convexity = 10, twist = twist, $fn = 100)
				translate([33, 0, 0])
					rotate([0,0,0]) circle(2.5, $fn=5);
		translate([0, 0, 2])
			linear_extrude(height = hexHeight, center = false, convexity = 10, twist = -twist, $fn = 100)
				translate([33, 0, 0])
					rotate([0,0,0]) circle(2.5, $fn=5);

	}
}

module jar2(){
	// TOP LIPS
	difference(){
		translate([0,0,-11]) cylinder(11,external_width,external_width,false);
		translate([0,0,-11.1]) cylinder(11.5,external_width-1,33,false);
	}
	// TOP
	difference(){
		translate([0,0,0]) cylinder(3,external_width,external_width,false);
		internal();
	}

	// Bottom
	translate([0,0,66]) cylinder(1.2,external_width,external_width,false);

	 // for(rotationz=[0:5.625:+360])
		//  rotate([0,0,rotationz]) branch3();
	
	 // W03
	 for(rotationz=[0:45:+360])
		 rotate([0,0,rotationz]) branch();
	 for(rotationz=[22.5:45:+380.5])
		 translate([0,0,hexHeight*2]) rotate([0,0,rotationz]) branch();
	 for(rotationz=[0:45:+360])
		 translate([0,0,hexHeight*4]) rotate([0,0,rotationz]) branch();

	// W02
	// union(){
	// 	for(rotationz=[0:20:+360])
	// 		rotate([0,0,rotationz])
	// 			linear_extrude(height = 66, center = false, convexity = 10, twist = 132, $fn = 100)
	// 				translate([33.5, 0, 0])
	// 					circle(1, $fn=6);
	// 	*for(rotationz=[20:15:+380])
	// 		rotate([0,0,rotationz])
	// 			linear_extrude(height = 66, center = false, convexity = 10, twist = -132, $fn = 100)
	// 				translate([33.5, 0, 0])
	// 					circle(1, $fn=6);

	// }

	*difference(){
		translate([0,0,0]) cylinder(68,33.5,33.5,false);
		internal();
	}


		

	// VIS LIPS
	intersection(){
		internal();
		union(){
			rotate([0,0,00]) lips();
			rotate([0,0,90]) lips();
			rotate([0,0,180]) lips();
			rotate([0,0,270]) lips();
		}
	}


}


module pot(){
	  difference(){
	 	translate([0,0,0]) cylinder(60,30,30,false);
	 	union(){
	 		translate([0,0,2]) cylinder(55,28,28,false);
	 		translate([0,0,55]) cylinder(2,28,29.5,false);
	 		translate([0,0,56.9]) cylinder(3.2,29.5,29.5,false);
			
		}
		
	}	
}


	color([0.2,0.2,0.2]) jar2();
	// color([1,1,0]) pot();
	translate([0,0,65.8]) rotate([180,0,0]) color([1,1,0]) pot();


*difference(){
	union(){
		// color("grey") jar2();
		color("green") pot();
	}
	translate([-150,0,-1]) cube([300,300,300]);
	translate([-0,-150,-1]) cube([300,300,300]);
}

*difference(){
	import("jar_W002.stl", convexity=3);
	translate([-150,0,-1]) cube([300,300,300]);
	translate([-300,-150,-1]) cube([300,300,300]);
}





