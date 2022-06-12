/*************************************************************************/
/*  location_delegate.h                                               */
/*************************************************************************/
#import <CoreLocation/CoreLocation.h>

@interface LocationDelegate : NSObject <CLLocationManagerDelegate>
@property (nonatomic,strong)CLLocationManager * locationManager;
@property (nonatomic,assign)CLLocation *coordinates;
@end
