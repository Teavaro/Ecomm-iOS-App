#import <Foundation/Foundation.h>
#import "SwrveGeoConfig.h"
#import "SwrveGeo.h"

@interface SwrveGeoSDK : NSObject

/*! Creates and initializes the SwrveGeoSDK.
 *
 * Call this directly after SwrveSDK.sharedInstanceWithAppID
 *
 * \returns SwrveGeo singleton instance.
 */
+ (SwrveGeo *)init;

/*! Creates and initializes the SwrveGeoSDK. 
 *
 * Call this directly after SwrveSDK.sharedInstanceWithAppID
 *
 * \param config Optional configurations.
 * \returns SwrveGeo singleton instance.
 */
+ (SwrveGeo *)initWithConfig:(SwrveGeoConfig *)config;

/*! Start the SwrveGeoSDK
 *
 * The permissions dialog will be shown the first time this is called and thereafter calling this will have no affect. This will allow you to choose an
 * opportune time to show the permissions dialog to the user.
 */
+ (void)start;

/*! Stop the SwrveGeoSDK.
 */
+ (void)stop;

/*! Return the SwrveGeoSDK version.
 * \returns The version string.
 */
+ (NSString *)version;

/*! Check if the SwrveGeoSDK is started.
 * \returns true if the SwrveGeoSDK is started and location permisison authorized
*/
+ (bool)isStarted;

@end
