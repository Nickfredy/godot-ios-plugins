/*************************************************************************/
/*  location_module.cpp                                                  */
/*************************************************************************/
/*************************************************************************/

#include "location_module.h"

#include "core/version.h"

#if VERSION_MAJOR == 4
#include "core/config/engine.h"
#else
#include "core/engine.h"
#endif

#include "location.h"

Location *location;

void register_location_plugin() {
	location = memnew(Location);
	Engine::get_singleton()->add_singleton(Engine::Singleton("Location", location));
}

void unregister_location_plugin() {
	if (location) {
		memdelete(location);
	}
}
