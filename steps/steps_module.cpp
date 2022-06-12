/*************************************************************************/
/*  steps_module.cpp                                                 	 */
/*************************************************************************/
#include "steps_module.h"
#include "core/version.h"
#if VERSION_MAJOR == 4
#include "core/config/engine.h"
#else
#include "core/engine.h"
#endif
#include "steps.h"

Steps *steps;
void register_steps_plugin() {
	steps = memnew(Steps);
	Engine::get_singleton()->add_singleton(Engine::Singleton("Steps", steps));
}

void unregister_steps_plugin() {
	if (steps) {
		memdelete(steps);
	}
}