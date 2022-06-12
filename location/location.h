/*************************************************************************/
/*  location.h                                                           */
/*************************************************************************/
/*************************************************************************/

#ifndef LOCATION_H
#define LOCATION_H

#include "core/version.h"
#if VERSION_MAJOR == 4
#include "core/object/class_db.h"
#else
#include "core/object.h"
#endif

class Location : public Object {

	GDCLASS(Location, Object);

	static Location *instance;
	static void _bind_methods();

public:
	static Location *get_singleton();
    Dictionary getLocation();
	Location();
	~Location();
};

#endif
