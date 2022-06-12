/*************************************************************************/
/*  godot_svc.h                                                          */
/*************************************************************************/

#ifndef STEPS_H
#define STEPS_H

#include "core/version.h"
#if VERSION_MAJOR == 4
#include "core/object/class_db.h"
#else
#include "core/object.h"
#endif

class Steps : public Object {

	GDCLASS(Steps, Object);

	static Steps *instance;
	static void _bind_methods();

public:
	static Steps *get_singleton();
    Dictionary getSteps();
	void startTracking();
	Steps();
	~Steps();
};

#endif