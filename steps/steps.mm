/*************************************************************************/
/* steps.mm                                                              */
/*************************************************************************/
#include "steps.h"

#import "platform/iphone/app_delegate.h"
#import "platform/iphone/view_controller.h"
#import "steps_delegate.mm"
#import <Foundation/Foundation.h>

Steps *Steps::instance = NULL;
StepsDelegate *steps_delegate = nil;
void Steps::_bind_methods() {
    ClassDB::bind_method(D_METHOD("getSteps"), &Steps::getSteps);
    ClassDB::bind_method(D_METHOD("startTracking"), &Steps::startTracking);
}

Steps::Steps() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
	steps_delegate = [[StepsDelegate alloc] init];
}

void Steps::startTracking(){
    [steps_delegate start_tracking];
}

Dictionary Steps::getSteps(){
    Dictionary dictionary;
    dictionary["num_steps"] = steps_delegate.numberOfSteps;
    dictionary["distance"] = steps_delegate.distance;
    dictionary["current_pace"] = steps_delegate.currentPace;
    dictionary["current_cadence"] = steps_delegate.currentCadence;
    return dictionary;
}

Steps *Steps::get_singleton() {
	return instance;
};

Steps::~Steps() {
    if (steps_delegate) {
		steps_delegate = nil;
	}
}
