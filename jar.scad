
$fa = 2;


module internal(){
	translate([0,0,-.5]) cylinder(11,31.5,31.5,false);
}

module lips(){
	translate([61.5,0,0]) cylinder(1,31.5,31.5,false);
}


module jar(){

	 // MAIN 
	difference(){
		translate([0,0,0]) cylinder(10,35.5,35.5,false);
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


	// 45 top lips 
	difference(){
		translate([0,0,8]) cylinder(2,35.5,35.5,false);
		translate([0,0,7]) cylinder(4,33,29,false);
	}

	// 45 top lips 
	difference(){
		translate([0,0,10]) cylinder(1,35.5,35.5,false);
		translate([0,0,9.5]) cylinder(2,30,30,false);
	}


	// MiniJar inclosure connector
	difference(){
		translate([0,0,11]) cylinder(2,35.5,35.5,false);
		translate([0,0,10.5]) cylinder(3,30,30.5,false);
	}


	// MiniJar inclosure connector
	difference(){
		translate([0,0,13]) cylinder(60,35.5,35.5,false);
		translate([0,0,12.5]) cylinder(56,30.5,30.5,false);
	}

}


difference(){
	jar();
	translate([-150,0,-1]) cube([300,300,300]);
	
}