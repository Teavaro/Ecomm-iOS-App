#import <Foundation/Foundation.h>
#import "SwrveGeoCustomFilterDelegate.h"
#import "SwrveGeofenceTransitionDelegate.h"

@interface SwrveGeoConfig : NSObject

/*! Configure this property to filter and modify the geo notifications */
@property(weak,nonatomic) id <SwrveGeoCustomFilterDelegate> customFilterDelegate;

/*! Configure this property to receive callbacks on certain location events*/
@property(weak,nonatomic) id <SwrveGeofenceTransitionDelegate> swrveGeofenceTransitionDelegate;


@end
