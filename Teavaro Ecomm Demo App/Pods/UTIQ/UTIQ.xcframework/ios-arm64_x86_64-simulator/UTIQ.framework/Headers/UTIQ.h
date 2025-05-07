#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class NSError, UtiqCoreBaseError, UtiqDataDomainNotFoundException, UtiqDataValueNotFoundException, UtiqEmptySetCookieHeaderException, UtiqIdConnectData, UtiqIdConnectDataNotFoundException, UtiqInvalidConsentVersionsException, UtiqInvalidSamlAuthenticationURLException, UtiqInvalidSamlLocationURLException, UtiqInvalidSamlSessionIdException, UtiqInvalidStubTokenException, UtiqKotlinArray<T>, UtiqKotlinThrowable, UtiqMnoIneligibleException, UtiqMnoUrlNotFoundException, UtiqNetworkIdentificationException, UtiqTemplateDataUrlNotFoundException, UtiqUnKnowUserStatusException, UtiqUndefinedTelcoException, UtiqUnknownTelcoUseCaseException, UtiqUserOptedOutFromUtiqException, UtiqUtiq, UtiqUtiqConsentExpiredException, UtiqUtiqConsentNotSetException, UtiqUtiqOptions;

@protocol UtiqCoreSDKMainClassUtils, UtiqKotlinIterator;

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wnullability"

#pragma push_macro("_Nullable_result")
#if !__has_feature(nullability_nullable_result)
#undef _Nullable_result
#define _Nullable_result _Nullable
#endif

__attribute__((swift_name("KotlinBase")))
@interface UtiqBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end

@interface UtiqBase (UtiqBaseCopying) <NSCopying>
@end

__attribute__((swift_name("KotlinMutableSet")))
@interface UtiqMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end

__attribute__((swift_name("KotlinMutableDictionary")))
@interface UtiqMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end

@interface NSError (NSErrorUtiqKotlinException)
@property (readonly) id _Nullable kotlinException;
@end

__attribute__((swift_name("KotlinNumber")))
@interface UtiqNumber : NSNumber
- (instancetype)initWithChar:(char)value __attribute__((unavailable));
- (instancetype)initWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
- (instancetype)initWithShort:(short)value __attribute__((unavailable));
- (instancetype)initWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
- (instancetype)initWithInt:(int)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
- (instancetype)initWithLong:(long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
- (instancetype)initWithLongLong:(long long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
- (instancetype)initWithFloat:(float)value __attribute__((unavailable));
- (instancetype)initWithDouble:(double)value __attribute__((unavailable));
- (instancetype)initWithBool:(BOOL)value __attribute__((unavailable));
- (instancetype)initWithInteger:(NSInteger)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
+ (instancetype)numberWithChar:(char)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
+ (instancetype)numberWithShort:(short)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
+ (instancetype)numberWithInt:(int)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
+ (instancetype)numberWithLong:(long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
+ (instancetype)numberWithLongLong:(long long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
+ (instancetype)numberWithFloat:(float)value __attribute__((unavailable));
+ (instancetype)numberWithDouble:(double)value __attribute__((unavailable));
+ (instancetype)numberWithBool:(BOOL)value __attribute__((unavailable));
+ (instancetype)numberWithInteger:(NSInteger)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
@end

__attribute__((swift_name("KotlinByte")))
@interface UtiqByte : UtiqNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end

__attribute__((swift_name("KotlinUByte")))
@interface UtiqUByte : UtiqNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end

__attribute__((swift_name("KotlinShort")))
@interface UtiqShort : UtiqNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end

__attribute__((swift_name("KotlinUShort")))
@interface UtiqUShort : UtiqNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end

__attribute__((swift_name("KotlinInt")))
@interface UtiqInt : UtiqNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end

__attribute__((swift_name("KotlinUInt")))
@interface UtiqUInt : UtiqNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end

__attribute__((swift_name("KotlinLong")))
@interface UtiqLong : UtiqNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end

__attribute__((swift_name("KotlinULong")))
@interface UtiqULong : UtiqNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end

__attribute__((swift_name("KotlinFloat")))
@interface UtiqFloat : UtiqNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end

__attribute__((swift_name("KotlinDouble")))
@interface UtiqDouble : UtiqNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end

__attribute__((swift_name("KotlinBoolean")))
@interface UtiqBoolean : UtiqNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectData")))
@interface UtiqIdConnectData : UtiqBase
- (instancetype)initWithMtid:(NSString * _Nullable)mtid atid:(NSString * _Nullable)atid attrid:(NSString * _Nullable)attrid __attribute__((swift_name("init(mtid:atid:attrid:)"))) __attribute__((objc_designated_initializer));
- (UtiqIdConnectData *)doCopyMtid:(NSString * _Nullable)mtid atid:(NSString * _Nullable)atid attrid:(NSString * _Nullable)attrid __attribute__((swift_name("doCopy(mtid:atid:attrid:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString * _Nullable atid __attribute__((swift_name("atid")));
@property (readonly) NSString * _Nullable attrid __attribute__((swift_name("attrid")));
@property (readonly) NSString * _Nullable mtid __attribute__((swift_name("mtid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UtiqOptions")))
@interface UtiqUtiqOptions : UtiqBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (UtiqUtiqOptions *)enableLogging __attribute__((swift_name("enableLogging()")));
- (UtiqUtiqOptions *)setFallBackConfigJsonJson:(NSString *)json __attribute__((swift_name("setFallBackConfigJson(json:)")));
@end

__attribute__((swift_name("KotlinThrowable")))
@interface UtiqKotlinThrowable : UtiqBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(UtiqKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(UtiqKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));

/**
 * @note annotations
 *   kotlin.experimental.ExperimentalNativeApi
*/
- (UtiqKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) UtiqKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
- (NSError *)asError __attribute__((swift_name("asError()")));
@end

__attribute__((swift_name("CoreBaseError")))
@interface UtiqCoreBaseError : UtiqKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(UtiqKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(UtiqKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int64_t code __attribute__((swift_name("code")));
@property (readonly) NSString *message __attribute__((swift_name("message")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DataDomainNotFoundException")))
@interface UtiqDataDomainNotFoundException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)dataDomainNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqDataDomainNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DataValueNotFoundException")))
@interface UtiqDataValueNotFoundException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)dataValueNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqDataValueNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("EmptySetCookieHeaderException")))
@interface UtiqEmptySetCookieHeaderException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)emptySetCookieHeaderException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqEmptySetCookieHeaderException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectDataNotFoundException")))
@interface UtiqIdConnectDataNotFoundException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)idConnectDataNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqIdConnectDataNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidConsentVersionsException")))
@interface UtiqInvalidConsentVersionsException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidConsentVersionsException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqInvalidConsentVersionsException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlAuthenticationURLException")))
@interface UtiqInvalidSamlAuthenticationURLException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlAuthenticationURLException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqInvalidSamlAuthenticationURLException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlLocationURLException")))
@interface UtiqInvalidSamlLocationURLException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlLocationURLException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqInvalidSamlLocationURLException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlSessionIdException")))
@interface UtiqInvalidSamlSessionIdException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlSessionIdException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqInvalidSamlSessionIdException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidStubTokenException")))
@interface UtiqInvalidStubTokenException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidStubTokenException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqInvalidStubTokenException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MnoIneligibleException")))
@interface UtiqMnoIneligibleException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)mnoIneligibleException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqMnoIneligibleException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MnoUrlNotFoundException")))
@interface UtiqMnoUrlNotFoundException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)mnoUrlNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqMnoUrlNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("NetworkIdentificationException")))
@interface UtiqNetworkIdentificationException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)networkIdentificationException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqNetworkIdentificationException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("TemplateDataUrlNotFoundException")))
@interface UtiqTemplateDataUrlNotFoundException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)templateDataUrlNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqTemplateDataUrlNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UnKnowUserStatusException")))
@interface UtiqUnKnowUserStatusException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)unKnowUserStatusException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUnKnowUserStatusException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UndefinedTelcoException")))
@interface UtiqUndefinedTelcoException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)undefinedTelcoException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUndefinedTelcoException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UnknownTelcoUseCaseException")))
@interface UtiqUnknownTelcoUseCaseException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)unknownTelcoUseCaseException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUnknownTelcoUseCaseException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UserOptedOutFromUtiqException")))
@interface UtiqUserOptedOutFromUtiqException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)userOptedOutFromUtiqException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUserOptedOutFromUtiqException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UtiqConsentExpiredException")))
@interface UtiqUtiqConsentExpiredException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)utiqConsentExpiredException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUtiqConsentExpiredException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UtiqConsentNotSetException")))
@interface UtiqUtiqConsentNotSetException : UtiqCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)utiqConsentNotSetException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUtiqConsentNotSetException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("CoreSDKMainClassUtils")))
@protocol UtiqCoreSDKMainClassUtils
@required

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (id _Nullable)tryOrReThrowAndReturnError:(NSError * _Nullable * _Nullable)error function:(id _Nullable (^)(void))function __attribute__((swift_name("tryOrReThrow(function:)"))) __attribute__((swift_error(nonnull_error)));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)tryOrReThrowAndReturnError:(NSError * _Nullable * _Nullable)error function_:(void (^)(void))function __attribute__((swift_name("tryOrReThrow(function_:)")));
- (void)tryOrThrowFunction:(void (^)(void))function errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("tryOrThrow(function:errorCallback:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("Utiq")))
@interface UtiqUtiq : UtiqBase <UtiqCoreSDKMainClassUtils>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)utiq __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UtiqUtiq *shared __attribute__((swift_name("shared")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)acceptConsentAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("acceptConsent()")));
- (void)checkMNOEligibilitySuccessCallback:(void (^)(void))successCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("checkMNOEligibility(successCallback:errorCallback:)")));
- (void)checkMNOEligibilityStubToken:(NSString *)stubToken successCallback:(void (^)(void))successCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("checkMNOEligibility(stubToken:successCallback:errorCallback:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)clearDataAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("clearData()")));
- (NSString *)consentHubUrl __attribute__((swift_name("consentHubUrl()")));
- (NSString *)consentHubUrlStubToken:(NSString *)stubToken __attribute__((swift_name("consentHubUrl(stubToken:)")));
- (void)didInitializeWithResultSuccess:(void (^)(void))success failure:(void (^)(NSError *))failure __attribute__((swift_name("didInitializeWithResult(success:failure:)")));
- (void)fetchIdConnectDataDataCallback:(void (^)(UtiqIdConnectData *))dataCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("fetchIdConnectData(dataCallback:errorCallback:)")));
- (void)fetchIdConnectDataStubToken:(NSString *)stubToken dataCallback:(void (^)(UtiqIdConnectData *))dataCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("fetchIdConnectData(stubToken:dataCallback:errorCallback:)")));
- (void)initializeSdkToken:(NSString *)sdkToken __attribute__((swift_name("initialize(sdkToken:)")));
- (void)initializeSdkToken:(NSString *)sdkToken options:(UtiqUtiqOptions *)options __attribute__((swift_name("initialize(sdkToken:options:)")));
- (void)initializeSdkToken:(NSString *)sdkToken options:(UtiqUtiqOptions *)options success:(void (^)(void))success failure:(void (^)(NSError *))failure __attribute__((swift_name("initialize(sdkToken:options:success:failure:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)isConsentAcceptedAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("isConsentAccepted()"))) __attribute__((swift_error(nonnull_error)));
- (BOOL)isInitialized __attribute__((swift_name("isInitialized()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)rejectConsentAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("rejectConsent()")));
- (void)rejectConsentSuccessCallback:(void (^)(void))successCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("rejectConsent(successCallback:errorCallback:)")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface UtiqKotlinArray<T> : UtiqBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(UtiqInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<UtiqKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((swift_name("KotlinIterator")))
@protocol UtiqKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end

#pragma pop_macro("_Nullable_result")
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
