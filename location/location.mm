/*************************************************************************/
/*  location.mm                                                           */
/*************************************************************************/
#include "location.h"

#import "platform/iphone/app_delegate.h"
#import "platform/iphone/view_controller.h"
#import "location_delegate.mm"
#import <Foundation/Foundation.h>

#if VERSION_MAJOR == 4
typedef PackedByteArray GodotByteArray;
#define GODOT_FLOAT_VARIANT_TYPE Variant::FLOAT
#define GODOT_BYTE_ARRAY_VARIANT_TYPE Variant::PACKED_BYTE_ARRAY
#else
typedef PoolByteArray GodotByteArray;
#define GODOT_FLOAT_VARIANT_TYPE Variant::REAL
#define GODOT_BYTE_ARRAY_VARIANT_TYPE Variant::POOL_BYTE_ARRAY
#endif

Location *Location::instance = NULL;
LocationDelegate *locationDelegate = nil;
static Variant locationData = 0;
void Location::_bind_methods() {
    ClassDB::bind_method(D_METHOD("getLocation"), &Location::getLocation);
}

Dictionary Location::getLocation() {
    // NSLog(@"GETTING LOCATION DATA FROM PLUGIN");
    // return 25.0;
    // return locationDelegate.coordValues;
    NSLog(@"Getting Location Data");
    Dictionary dictionary;
    dictionary["latitudeNew"]=locationDelegate.latitudeNew;
    dictionary["longitutdeNew"]=locationDelegate.longitudeNew;
    // dictionary["latitudeOld"]=locationDelegate.latitudeOld;
    // dictionary["longitutdeOld"]=locationDelegate.longitudeOld;
    return dictionary;
}

Location::Location() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
	locationDelegate = [[LocationDelegate alloc] init];
    UIViewController *root_controller = [[UIApplication sharedApplication] delegate].window.rootViewController;
    [root_controller addChildViewController:locationDelegate];
    [root_controller.view addSubview:locationDelegate.view];
    [locationDelegate didMoveToParentViewController:root_controller]; 
}

Location *Location::get_singleton() {
	return instance;
};

Location::~Location() {
    if (locationDelegate) {
		locationDelegate = nil;
	}
}
