/* places.x */
typedef struct airport_place_node* airport_place;
typedef char airport_place_code[4];
typedef char city_place_name[64];
typedef char state_place_initials[3];

/* a node in the airports-places list*/
struct airport_place_node {
	airport_place_code airport_place;
	city_place_name city;
	state_place_initials state;
	double distance;
	airport_place next;
};

/* struct for city and state to send to places server */
struct city_state {
	city_place_name city;
	state_place_initials state;
};

/*result of a places operation*/
union places_ret switch (int err) {
	case 0:
		airport_place airport_place; /*no error, return airport_place entries as a linked list*/
	default:
 		void; /*error occured, nothing returned*/
};

/*IDL program*/
program PLACES_PROG {
	version PLACES_VERS {
		places_ret CALLPLACES(city_state) = 1;
	} = 1;
} = 0x20000025;
