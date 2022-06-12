/*************************************************************************/
/*  steps_delegate.mm                                                */
/*************************************************************************/
#import "platform/iphone/view_controller.h"
#import "CoreMotion/CoreMotion.h"

@interface StepsDelegate : NSObject
- (void)start_tracking;
@property (nonatomic,strong)CMPedometer *pedometer;
@property (nonatomic,assign)double numberOfSteps;
@property (nonatomic,assign)double distance; //meters
@property (nonatomic,assign)double currentPace; //(in seconds per meter)
@property (nonatomic,assign)double currentCadence; //(in steps per second)
@end

@implementation StepsDelegate
- (void)start_tracking {
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc]init];
        // start live tracking
        [_pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            // this block is called for each live update
            _numberOfSteps = [pedometerData.numberOfSteps doubleValue];
            _distance = [pedometerData.distance doubleValue];
            _currentPace = [pedometerData.currentPace doubleValue];
            _currentCadence = [pedometerData.currentCadence doubleValue];
        }];
    }
}

// retrieve data between dates
// [self.pedometer queryPedometerDataFromDate:self.startDate toDate:self.endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
//     // historic pedometer data is provided here
//     [self presentPedometerData:pedometerData];
// }];
@end

