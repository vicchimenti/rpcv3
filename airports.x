/* airport.x */
typedef struct airportnode* airport;
typedef char airport_code[4];
typedef char city_name[64];
typedef char state_initials[3];

/* a node in the airports list*/
struct airportnode {
	airport_code airport;
	city_name city;
	state_initials state;
	double distance;
	airport next;
};

/*struct to send lat long*/
struct coordinates {
	double lat;
	double lon;
};

/*result of a airport operation*/
union airports_ret switch (int err) {
	case 0:
		airport airport; /*no error, return airport entries as a linked list*/
	default:
 		void; /*error occured, nothing returned*/
};

/*IDL program*/
program AIRPORTS_PROG {
	version AIRPORTS_VERS {
		airports_ret GETAIRPORTS(coordinates) = 1;
	} = 1;
} = 0x20000026;
