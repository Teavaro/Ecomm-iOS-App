#import <Foundation/Foundation.h>
#import "SwrveNotificationFetcher.h"
#import "SwrveGeoCustomFilterDelegate.h"
#import "SwrveGeofence.h"

static NSString *const SWRVE_GEO_SDK_VERSION = @"5.1.0";

// Update the SwrveGEOSample README.md if min major/minor/patch version changes
static int const MIN_SWRVE_SDK_MAJOR_VERSION = 7;
static int const MIN_SWRVE_SDK_MINOR_VERSION = 0;
static int const MIN_SWRVE_SDK_PATCH_VERSION = 3;

static NSString *const EVENT_TYPE_GEOPLACE = @"geoplace";
static NSString *const EVENT_ACTION_TYPE_NAME = @"actionType";
static NSString *const EVENT_ACTIONTYPE_ENTER = @"enter";
static NSString *const EVENT_ACTIONTYPE_EXIT = @"exit";
static NSString *const EVENT_ID_NAME = @"id";
static NSString *const EVENT_GEOFENCE_ID_NAME = @"geofenceId";
static NSString *const EVENT_PAYLOAD_NAME = @"payload";
static NSString *const PAYLOAD_GEOPLACE_LABEL_KEY = @"GeoPlaceName";
static NSString *const PAYLOAD_GEODURATION_KEY = @"GeoDuration";
static NSString *const EVENT_TYPE_NAME = @"type";
static NSString *const EVENT_TIME_NAME = @"time";
static NSString *const EVENT_SEQNUM_NAME = @"seqnum";
static NSString *const EVENT_USER_NAME = @"user";
static NSString *const EVENT_SESSION_TOKEN_NAME = @"session_token";
static NSString *const EVENT_VERSION_NAME = @"version";
static NSString *const EVENT_APP_VERSION_NAME = @"app_version";
static NSString *const EVENT_UNIQUE_DEVICE_ID_NAME = @"unique_device_id";
static NSString *const EVENT_DATA_NAME = @"data";

@interface SwrveGeoManager : NSObject

- (id) initWithCustomFilter:(id<SwrveGeoCustomFilterDelegate>)customFilter;

- (void)triggerGeofence:(SwrveGeofence *)geofence forTransition:(NSString *)transition;

@end
