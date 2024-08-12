#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class UTIQIdConnectDataCompanion, UTIQIdConnectData, UTIQUTIQOptions, UTIQKotlinThrowable, UTIQKotlinArray<T>, UTIQCoreBaseError, UTIQDataDomainNotFoundException, UTIQDataValueNotFoundException, UTIQIdConnectApiHostNotFoundException, UTIQIdConnectDataNotFoundException, UTIQInvalidSamlAuthenticationURLException, UTIQInvalidSamlLocationURLException, UTIQInvalidSamlSessionIdException, UTIQInvalidStubTokenException, UTIQMnoIneligibleException, UTIQMnoUrlNotFoundException, UTIQUndefinedTelcoException, UTIQUnknownTelcoUseCaseException, UTIQUserOptedOutFromUtiqException, UTIQUtiqConsentNotSetException, UTIQUtiqNotStartedException, NSError, UTIQUTIQ, UTIQKotlinx_serialization_coreSerializersModule, UTIQKotlinx_serialization_coreSerialKind, UTIQKotlinNothing;

@protocol UTIQKotlinx_serialization_coreKSerializer, UTIQCoreSDKMainClassUtils, UTIQKotlinx_serialization_coreEncoder, UTIQKotlinx_serialization_coreSerialDescriptor, UTIQKotlinx_serialization_coreSerializationStrategy, UTIQKotlinx_serialization_coreDecoder, UTIQKotlinx_serialization_coreDeserializationStrategy, UTIQKotlinIterator, UTIQKotlinx_serialization_coreCompositeEncoder, UTIQKotlinAnnotation, UTIQKotlinx_serialization_coreCompositeDecoder, UTIQKotlinx_serialization_coreSerializersModuleCollector, UTIQKotlinKClass, UTIQKotlinKDeclarationContainer, UTIQKotlinKAnnotatedElement, UTIQKotlinKClassifier;

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
@interface UTIQBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end

@interface UTIQBase (UTIQBaseCopying) <NSCopying>
@end

__attribute__((swift_name("KotlinMutableSet")))
@interface UTIQMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end

__attribute__((swift_name("KotlinMutableDictionary")))
@interface UTIQMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end

@interface NSError (NSErrorUTIQKotlinException)
@property (readonly) id _Nullable kotlinException;
@end

__attribute__((swift_name("KotlinNumber")))
@interface UTIQNumber : NSNumber
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
@interface UTIQByte : UTIQNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end

__attribute__((swift_name("KotlinUByte")))
@interface UTIQUByte : UTIQNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end

__attribute__((swift_name("KotlinShort")))
@interface UTIQShort : UTIQNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end

__attribute__((swift_name("KotlinUShort")))
@interface UTIQUShort : UTIQNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end

__attribute__((swift_name("KotlinInt")))
@interface UTIQInt : UTIQNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end

__attribute__((swift_name("KotlinUInt")))
@interface UTIQUInt : UTIQNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end

__attribute__((swift_name("KotlinLong")))
@interface UTIQLong : UTIQNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end

__attribute__((swift_name("KotlinULong")))
@interface UTIQULong : UTIQNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end

__attribute__((swift_name("KotlinFloat")))
@interface UTIQFloat : UTIQNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end

__attribute__((swift_name("KotlinDouble")))
@interface UTIQDouble : UTIQNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end

__attribute__((swift_name("KotlinBoolean")))
@interface UTIQBoolean : UTIQNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end


/**
 * @note annotations
 *   kotlinx.serialization.Serializable
*/
__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectData")))
@interface UTIQIdConnectData : UTIQBase
- (instancetype)initWithMtid:(NSString * _Nullable)mtid atid:(NSString * _Nullable)atid __attribute__((swift_name("init(mtid:atid:)"))) __attribute__((objc_designated_initializer));
@property (class, readonly, getter=companion) UTIQIdConnectDataCompanion *companion __attribute__((swift_name("companion")));
- (UTIQIdConnectData *)doCopyMtid:(NSString * _Nullable)mtid atid:(NSString * _Nullable)atid __attribute__((swift_name("doCopy(mtid:atid:)")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) NSString * _Nullable atid __attribute__((swift_name("atid")));
@property (readonly) NSString * _Nullable mtid __attribute__((swift_name("mtid")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectData.Companion")))
@interface UTIQIdConnectDataCompanion : UTIQBase
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)companion __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQIdConnectDataCompanion *shared __attribute__((swift_name("shared")));
- (id<UTIQKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("serializer()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UTIQOptions")))
@interface UTIQUTIQOptions : UTIQBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (UTIQUTIQOptions *)enableLogging __attribute__((swift_name("enableLogging()")));
- (UTIQUTIQOptions *)setFallBackConfigJsonJson:(NSString *)json __attribute__((swift_name("setFallBackConfigJson(json:)")));
@end

__attribute__((swift_name("KotlinThrowable")))
@interface UTIQKotlinThrowable : UTIQBase
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(UTIQKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(UTIQKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));

/**
 * @note annotations
 *   kotlin.experimental.ExperimentalNativeApi
*/
- (UTIQKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) UTIQKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
- (NSError *)asError __attribute__((swift_name("asError()")));
@end

__attribute__((swift_name("CoreBaseError")))
@interface UTIQCoreBaseError : UTIQKotlinThrowable
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithCause:(UTIQKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(UTIQKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int64_t code __attribute__((swift_name("code")));
@property (readonly) NSString *message __attribute__((swift_name("message")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DataDomainNotFoundException")))
@interface UTIQDataDomainNotFoundException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)dataDomainNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQDataDomainNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("DataValueNotFoundException")))
@interface UTIQDataValueNotFoundException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)dataValueNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQDataValueNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectApiHostNotFoundException")))
@interface UTIQIdConnectApiHostNotFoundException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)idConnectApiHostNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQIdConnectApiHostNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("IdConnectDataNotFoundException")))
@interface UTIQIdConnectDataNotFoundException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)idConnectDataNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQIdConnectDataNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlAuthenticationURLException")))
@interface UTIQInvalidSamlAuthenticationURLException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlAuthenticationURLException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQInvalidSamlAuthenticationURLException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlLocationURLException")))
@interface UTIQInvalidSamlLocationURLException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlLocationURLException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQInvalidSamlLocationURLException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidSamlSessionIdException")))
@interface UTIQInvalidSamlSessionIdException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidSamlSessionIdException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQInvalidSamlSessionIdException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("InvalidStubTokenException")))
@interface UTIQInvalidStubTokenException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)invalidStubTokenException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQInvalidStubTokenException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MnoIneligibleException")))
@interface UTIQMnoIneligibleException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)mnoIneligibleException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQMnoIneligibleException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MnoUrlNotFoundException")))
@interface UTIQMnoUrlNotFoundException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)mnoUrlNotFoundException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQMnoUrlNotFoundException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UndefinedTelcoException")))
@interface UTIQUndefinedTelcoException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)undefinedTelcoException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUndefinedTelcoException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UnknownTelcoUseCaseException")))
@interface UTIQUnknownTelcoUseCaseException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)unknownTelcoUseCaseException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUnknownTelcoUseCaseException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UserOptedOutFromUtiqException")))
@interface UTIQUserOptedOutFromUtiqException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)userOptedOutFromUtiqException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUserOptedOutFromUtiqException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UtiqConsentNotSetException")))
@interface UTIQUtiqConsentNotSetException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)utiqConsentNotSetException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUtiqConsentNotSetException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("UtiqNotStartedException")))
@interface UTIQUtiqNotStartedException : UTIQCoreBaseError
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (instancetype)initWithMessage:(NSString *)message code:(int64_t)code __attribute__((swift_name("init(message:code:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
+ (instancetype)utiqNotStartedException __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUtiqNotStartedException *shared __attribute__((swift_name("shared")));
- (BOOL)isEqual:(id _Nullable)other __attribute__((swift_name("isEqual(_:)")));
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("CoreSDKMainClassUtils")))
@protocol UTIQCoreSDKMainClassUtils
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
__attribute__((swift_name("UTIQ")))
@interface UTIQUTIQ : UTIQBase <UTIQCoreSDKMainClassUtils>
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
+ (instancetype)uTIQ __attribute__((swift_name("init()")));
@property (class, readonly, getter=shared) UTIQUTIQ *shared __attribute__((swift_name("shared")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)acceptConsentAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("acceptConsent()")));
- (void)checkMNOEligibilitySuccessCallback:(void (^)(void))successCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("checkMNOEligibility(successCallback:errorCallback:)")));
- (void)checkMNOEligibilityStubToken:(NSString *)stubToken successCallback:(void (^)(void))successCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("checkMNOEligibility(stubToken:successCallback:errorCallback:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)clearCookiesAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("clearCookies()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)clearDataAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("clearData()")));
- (NSString *)consentHubUrl __attribute__((swift_name("consentHubUrl()")));
- (void)didInitializeWithResultSuccess:(void (^)(void))success failure:(void (^)(NSError *))failure __attribute__((swift_name("didInitializeWithResult(success:failure:)")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (UTIQIdConnectData * _Nullable)idConnectDataAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("idConnectData()")));
- (void)initializeSdkToken:(NSString *)sdkToken __attribute__((swift_name("initialize(sdkToken:)")));
- (void)initializeSdkToken:(NSString *)sdkToken options:(UTIQUTIQOptions *)options __attribute__((swift_name("initialize(sdkToken:options:)")));
- (void)initializeSdkToken:(NSString *)sdkToken options:(UTIQUTIQOptions *)options success:(void (^)(void))success failure:(void (^)(NSError *))failure __attribute__((swift_name("initialize(sdkToken:options:success:failure:)")));

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

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)startServiceAndReturnError:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("startService()")));

/**
 * @note This method converts all Kotlin exceptions to errors.
*/
- (BOOL)startServiceStubToken:(NSString *)stubToken error:(NSError * _Nullable * _Nullable)error __attribute__((swift_name("startService(stubToken:)")));
- (void)startServiceDataCallback:(void (^)(UTIQIdConnectData *))dataCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("startService(dataCallback:errorCallback:)")));
- (void)startServiceStubToken:(NSString *)stubToken dataCallback:(void (^)(UTIQIdConnectData *))dataCallback errorCallback:(void (^)(NSError *))errorCallback __attribute__((swift_name("startService(stubToken:dataCallback:errorCallback:)")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializationStrategy")))
@protocol UTIQKotlinx_serialization_coreSerializationStrategy
@required
- (void)serializeEncoder:(id<UTIQKotlinx_serialization_coreEncoder>)encoder value:(id _Nullable)value __attribute__((swift_name("serialize(encoder:value:)")));
@property (readonly) id<UTIQKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDeserializationStrategy")))
@protocol UTIQKotlinx_serialization_coreDeserializationStrategy
@required
- (id _Nullable)deserializeDecoder:(id<UTIQKotlinx_serialization_coreDecoder>)decoder __attribute__((swift_name("deserialize(decoder:)")));
@property (readonly) id<UTIQKotlinx_serialization_coreSerialDescriptor> descriptor __attribute__((swift_name("descriptor")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreKSerializer")))
@protocol UTIQKotlinx_serialization_coreKSerializer <UTIQKotlinx_serialization_coreSerializationStrategy, UTIQKotlinx_serialization_coreDeserializationStrategy>
@required
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface UTIQKotlinArray<T> : UTIQBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(UTIQInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<UTIQKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreEncoder")))
@protocol UTIQKotlinx_serialization_coreEncoder
@required
- (id<UTIQKotlinx_serialization_coreCompositeEncoder>)beginCollectionDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor collectionSize:(int32_t)collectionSize __attribute__((swift_name("beginCollection(descriptor:collectionSize:)")));
- (id<UTIQKotlinx_serialization_coreCompositeEncoder>)beginStructureDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (void)encodeBooleanValue:(BOOL)value __attribute__((swift_name("encodeBoolean(value:)")));
- (void)encodeByteValue:(int8_t)value __attribute__((swift_name("encodeByte(value:)")));
- (void)encodeCharValue:(unichar)value __attribute__((swift_name("encodeChar(value:)")));
- (void)encodeDoubleValue:(double)value __attribute__((swift_name("encodeDouble(value:)")));
- (void)encodeEnumEnumDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)enumDescriptor index:(int32_t)index __attribute__((swift_name("encodeEnum(enumDescriptor:index:)")));
- (void)encodeFloatValue:(float)value __attribute__((swift_name("encodeFloat(value:)")));
- (id<UTIQKotlinx_serialization_coreEncoder>)encodeInlineDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("encodeInline(descriptor:)")));
- (void)encodeIntValue:(int32_t)value __attribute__((swift_name("encodeInt(value:)")));
- (void)encodeLongValue:(int64_t)value __attribute__((swift_name("encodeLong(value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNotNullMark __attribute__((swift_name("encodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNull __attribute__((swift_name("encodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableValueSerializer:(id<UTIQKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableValue(serializer:value:)")));
- (void)encodeSerializableValueSerializer:(id<UTIQKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableValue(serializer:value:)")));
- (void)encodeShortValue:(int16_t)value __attribute__((swift_name("encodeShort(value:)")));
- (void)encodeStringValue:(NSString *)value __attribute__((swift_name("encodeString(value:)")));
@property (readonly) UTIQKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerialDescriptor")))
@protocol UTIQKotlinx_serialization_coreSerialDescriptor
@required

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSArray<id<UTIQKotlinAnnotation>> *)getElementAnnotationsIndex:(int32_t)index __attribute__((swift_name("getElementAnnotations(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<UTIQKotlinx_serialization_coreSerialDescriptor>)getElementDescriptorIndex:(int32_t)index __attribute__((swift_name("getElementDescriptor(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (int32_t)getElementIndexName:(NSString *)name __attribute__((swift_name("getElementIndex(name:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (NSString *)getElementNameIndex:(int32_t)index __attribute__((swift_name("getElementName(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)isElementOptionalIndex:(int32_t)index __attribute__((swift_name("isElementOptional(index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSArray<id<UTIQKotlinAnnotation>> *annotations __attribute__((swift_name("annotations")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) int32_t elementsCount __attribute__((swift_name("elementsCount")));
@property (readonly) BOOL isInline __attribute__((swift_name("isInline")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) BOOL isNullable __attribute__((swift_name("isNullable")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) UTIQKotlinx_serialization_coreSerialKind *kind __attribute__((swift_name("kind")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
@property (readonly) NSString *serialName __attribute__((swift_name("serialName")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreDecoder")))
@protocol UTIQKotlinx_serialization_coreDecoder
@required
- (id<UTIQKotlinx_serialization_coreCompositeDecoder>)beginStructureDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("beginStructure(descriptor:)")));
- (BOOL)decodeBoolean __attribute__((swift_name("decodeBoolean()")));
- (int8_t)decodeByte __attribute__((swift_name("decodeByte()")));
- (unichar)decodeChar __attribute__((swift_name("decodeChar()")));
- (double)decodeDouble __attribute__((swift_name("decodeDouble()")));
- (int32_t)decodeEnumEnumDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)enumDescriptor __attribute__((swift_name("decodeEnum(enumDescriptor:)")));
- (float)decodeFloat __attribute__((swift_name("decodeFloat()")));
- (id<UTIQKotlinx_serialization_coreDecoder>)decodeInlineDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeInline(descriptor:)")));
- (int32_t)decodeInt __attribute__((swift_name("decodeInt()")));
- (int64_t)decodeLong __attribute__((swift_name("decodeLong()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeNotNullMark __attribute__((swift_name("decodeNotNullMark()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (UTIQKotlinNothing * _Nullable)decodeNull __attribute__((swift_name("decodeNull()")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableValueDeserializer:(id<UTIQKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeNullableSerializableValue(deserializer:)")));
- (id _Nullable)decodeSerializableValueDeserializer:(id<UTIQKotlinx_serialization_coreDeserializationStrategy>)deserializer __attribute__((swift_name("decodeSerializableValue(deserializer:)")));
- (int16_t)decodeShort __attribute__((swift_name("decodeShort()")));
- (NSString *)decodeString __attribute__((swift_name("decodeString()")));
@property (readonly) UTIQKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("KotlinIterator")))
@protocol UTIQKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeEncoder")))
@protocol UTIQKotlinx_serialization_coreCompositeEncoder
@required
- (void)encodeBooleanElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(BOOL)value __attribute__((swift_name("encodeBooleanElement(descriptor:index:value:)")));
- (void)encodeByteElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int8_t)value __attribute__((swift_name("encodeByteElement(descriptor:index:value:)")));
- (void)encodeCharElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(unichar)value __attribute__((swift_name("encodeCharElement(descriptor:index:value:)")));
- (void)encodeDoubleElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(double)value __attribute__((swift_name("encodeDoubleElement(descriptor:index:value:)")));
- (void)encodeFloatElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(float)value __attribute__((swift_name("encodeFloatElement(descriptor:index:value:)")));
- (id<UTIQKotlinx_serialization_coreEncoder>)encodeInlineElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("encodeInlineElement(descriptor:index:)")));
- (void)encodeIntElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int32_t)value __attribute__((swift_name("encodeIntElement(descriptor:index:value:)")));
- (void)encodeLongElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int64_t)value __attribute__((swift_name("encodeLongElement(descriptor:index:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)encodeNullableSerializableElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<UTIQKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeNullableSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeSerializableElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index serializer:(id<UTIQKotlinx_serialization_coreSerializationStrategy>)serializer value:(id _Nullable)value __attribute__((swift_name("encodeSerializableElement(descriptor:index:serializer:value:)")));
- (void)encodeShortElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(int16_t)value __attribute__((swift_name("encodeShortElement(descriptor:index:value:)")));
- (void)encodeStringElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index value:(NSString *)value __attribute__((swift_name("encodeStringElement(descriptor:index:value:)")));
- (void)endStructureDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)shouldEncodeElementDefaultDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("shouldEncodeElementDefault(descriptor:index:)")));
@property (readonly) UTIQKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreSerializersModule")))
@interface UTIQKotlinx_serialization_coreSerializersModule : UTIQBase

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (void)dumpToCollector:(id<UTIQKotlinx_serialization_coreSerializersModuleCollector>)collector __attribute__((swift_name("dumpTo(collector:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<UTIQKotlinx_serialization_coreKSerializer> _Nullable)getContextualKClass:(id<UTIQKotlinKClass>)kClass typeArgumentsSerializers:(NSArray<id<UTIQKotlinx_serialization_coreKSerializer>> *)typeArgumentsSerializers __attribute__((swift_name("getContextual(kClass:typeArgumentsSerializers:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<UTIQKotlinx_serialization_coreSerializationStrategy> _Nullable)getPolymorphicBaseClass:(id<UTIQKotlinKClass>)baseClass value:(id)value __attribute__((swift_name("getPolymorphic(baseClass:value:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id<UTIQKotlinx_serialization_coreDeserializationStrategy> _Nullable)getPolymorphicBaseClass:(id<UTIQKotlinKClass>)baseClass serializedClassName:(NSString * _Nullable)serializedClassName __attribute__((swift_name("getPolymorphic(baseClass:serializedClassName:)")));
@end

__attribute__((swift_name("KotlinAnnotation")))
@protocol UTIQKotlinAnnotation
@required
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerialKind")))
@interface UTIQKotlinx_serialization_coreSerialKind : UTIQBase
- (NSUInteger)hash __attribute__((swift_name("hash()")));
- (NSString *)description __attribute__((swift_name("description()")));
@end

__attribute__((swift_name("Kotlinx_serialization_coreCompositeDecoder")))
@protocol UTIQKotlinx_serialization_coreCompositeDecoder
@required
- (BOOL)decodeBooleanElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeBooleanElement(descriptor:index:)")));
- (int8_t)decodeByteElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeByteElement(descriptor:index:)")));
- (unichar)decodeCharElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeCharElement(descriptor:index:)")));
- (int32_t)decodeCollectionSizeDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeCollectionSize(descriptor:)")));
- (double)decodeDoubleElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeDoubleElement(descriptor:index:)")));
- (int32_t)decodeElementIndexDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("decodeElementIndex(descriptor:)")));
- (float)decodeFloatElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeFloatElement(descriptor:index:)")));
- (id<UTIQKotlinx_serialization_coreDecoder>)decodeInlineElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeInlineElement(descriptor:index:)")));
- (int32_t)decodeIntElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeIntElement(descriptor:index:)")));
- (int64_t)decodeLongElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeLongElement(descriptor:index:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (id _Nullable)decodeNullableSerializableElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<UTIQKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeNullableSerializableElement(descriptor:index:deserializer:previousValue:)")));

/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
- (BOOL)decodeSequentially __attribute__((swift_name("decodeSequentially()")));
- (id _Nullable)decodeSerializableElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index deserializer:(id<UTIQKotlinx_serialization_coreDeserializationStrategy>)deserializer previousValue:(id _Nullable)previousValue __attribute__((swift_name("decodeSerializableElement(descriptor:index:deserializer:previousValue:)")));
- (int16_t)decodeShortElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeShortElement(descriptor:index:)")));
- (NSString *)decodeStringElementDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor index:(int32_t)index __attribute__((swift_name("decodeStringElement(descriptor:index:)")));
- (void)endStructureDescriptor:(id<UTIQKotlinx_serialization_coreSerialDescriptor>)descriptor __attribute__((swift_name("endStructure(descriptor:)")));
@property (readonly) UTIQKotlinx_serialization_coreSerializersModule *serializersModule __attribute__((swift_name("serializersModule")));
@end

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinNothing")))
@interface UTIQKotlinNothing : UTIQBase
@end


/**
 * @note annotations
 *   kotlinx.serialization.ExperimentalSerializationApi
*/
__attribute__((swift_name("Kotlinx_serialization_coreSerializersModuleCollector")))
@protocol UTIQKotlinx_serialization_coreSerializersModuleCollector
@required
- (void)contextualKClass:(id<UTIQKotlinKClass>)kClass provider:(id<UTIQKotlinx_serialization_coreKSerializer> (^)(NSArray<id<UTIQKotlinx_serialization_coreKSerializer>> *))provider __attribute__((swift_name("contextual(kClass:provider:)")));
- (void)contextualKClass:(id<UTIQKotlinKClass>)kClass serializer:(id<UTIQKotlinx_serialization_coreKSerializer>)serializer __attribute__((swift_name("contextual(kClass:serializer:)")));
- (void)polymorphicBaseClass:(id<UTIQKotlinKClass>)baseClass actualClass:(id<UTIQKotlinKClass>)actualClass actualSerializer:(id<UTIQKotlinx_serialization_coreKSerializer>)actualSerializer __attribute__((swift_name("polymorphic(baseClass:actualClass:actualSerializer:)")));
- (void)polymorphicDefaultBaseClass:(id<UTIQKotlinKClass>)baseClass defaultDeserializerProvider:(id<UTIQKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefault(baseClass:defaultDeserializerProvider:)"))) __attribute__((deprecated("Deprecated in favor of function with more precise name: polymorphicDefaultDeserializer")));
- (void)polymorphicDefaultDeserializerBaseClass:(id<UTIQKotlinKClass>)baseClass defaultDeserializerProvider:(id<UTIQKotlinx_serialization_coreDeserializationStrategy> _Nullable (^)(NSString * _Nullable))defaultDeserializerProvider __attribute__((swift_name("polymorphicDefaultDeserializer(baseClass:defaultDeserializerProvider:)")));
- (void)polymorphicDefaultSerializerBaseClass:(id<UTIQKotlinKClass>)baseClass defaultSerializerProvider:(id<UTIQKotlinx_serialization_coreSerializationStrategy> _Nullable (^)(id))defaultSerializerProvider __attribute__((swift_name("polymorphicDefaultSerializer(baseClass:defaultSerializerProvider:)")));
@end

__attribute__((swift_name("KotlinKDeclarationContainer")))
@protocol UTIQKotlinKDeclarationContainer
@required
@end

__attribute__((swift_name("KotlinKAnnotatedElement")))
@protocol UTIQKotlinKAnnotatedElement
@required
@end


/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
__attribute__((swift_name("KotlinKClassifier")))
@protocol UTIQKotlinKClassifier
@required
@end

__attribute__((swift_name("KotlinKClass")))
@protocol UTIQKotlinKClass <UTIQKotlinKDeclarationContainer, UTIQKotlinKAnnotatedElement, UTIQKotlinKClassifier>
@required

/**
 * @note annotations
 *   kotlin.SinceKotlin(version="1.1")
*/
- (BOOL)isInstanceValue:(id _Nullable)value __attribute__((swift_name("isInstance(value:)")));
@property (readonly) NSString * _Nullable qualifiedName __attribute__((swift_name("qualifiedName")));
@property (readonly) NSString * _Nullable simpleName __attribute__((swift_name("simpleName")));
@end

#pragma pop_macro("_Nullable_result")
#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
