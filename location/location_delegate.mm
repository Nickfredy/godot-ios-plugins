// /*************************************************************************/
// /*  location_delegate.mm                                                 */
// /*************************************************************************/
#import "platform/iphone/view_controller.h"
#import <CoreLocation/CoreLocation.h>
@interface LocationDelegate : UIViewController <CLLocationManagerDelegate>
  @property (nonatomic,strong)CLLocationManager * locationManager;
  @property (nonatomic,assign)double latitudeNew;
  @property (nonatomic,assign)double longitudeNew;
  @property (nonatomic,assign)double latitudeOld;
  @property (nonatomic,assign)double longitudeOld;
  @property (nonatomic,assign)double coordValues;
@end

@implementation LocationDelegate

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"inside view did load");
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    [_locationManager requestWhenInUseAuthorization]; // Add This Line
}
// - (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//     {
//         // NSLog(@"didUpdateToLocation: %@", newLocation);
//         // CLLocation *currentLocation = newLocation;
//         if (newLocation != nil) {
//            _latitudeNew = newLocation.coordinate.latitude;
//            _longitudeNew = newLocation.coordinate.longitude;
//             if(oldLocation != nil){
//                 _latitudeOld = oldLocation.coordinate.latitude;
//                 _longitudeOld = oldLocation.coordinate.longitude;
//             }
//             // _coordsOld=oldLocation;
//             // _coordinates = newLocation;
//         }
//     }
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    // CLLocation *oldLocation;
    // if (locations.count > 1) {
    //     oldLocation = [locations objectAtIndex:locations.count-2];
    //     _latitudeOld = oldLocation.coordinate.latitude;
    //     _longitudeOld = oldLocation.coordinate.longitude;
    // } else {
    //     oldLocation = nil;
    // }
    _latitudeNew = newLocation.coordinate.latitude;
    _longitudeNew = newLocation.coordinate.longitude;
    // NSLog(@"didUpdateToLocation %@ from %@", newLocation, oldLocation);
    // MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 1500.0, 1500.0);
    // [regionsMapView setRegion:userLocation animated:YES];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"failed to fetch current location : %@", error);
 }
@end