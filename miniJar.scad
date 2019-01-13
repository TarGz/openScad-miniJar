include<thread.scad>;



difference(){
	translate([0,0,-2.5]) cylinder(7,30,30,false);



	union(){
		// Up
		translate([0,0,-2.9]) cylinder(3,25,25,false);
		metric_thread (diameter=50, pitch=1.6, length=2.5, internal=true, n_starts=10, groove=false);
		// Bottom
		translate([0,0,2.4]) cylinder(3,26,30,false);
	}
}


