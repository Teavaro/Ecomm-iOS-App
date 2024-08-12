#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SwrveGeofenceTransitionDelegate <NSObject>

@optional

/// Called when when a region is entered or exited.
/// @param name NSString geofence name associated with the boundary transition
/// @param transition NSString transition type: enter or exit
/// @param location CLLocation object
/// @param customProperties  NSString json with custom properties
- (void)triggered:(NSString *)name transition:(NSString *)transition atLocation:(CLLocation *)location customProperties:(nullable NSString *)customProperties;

@end

NS_ASSUME_NONNULL_END

