
#import "RNUserExperior.h"
@import UserExperiorSDK;
#import <objc/runtime.h>

@implementation RNUserExperior

@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(UserExperior)

RCT_EXPORT_METHOD(startRecording: (NSString *) versionKey){
    dispatch_async(self.methodQueue, ^{
        [UserExperior startRecordingWithVersionKey:versionKey];
    });
}

RCT_EXPORT_METHOD(setUserIdentifier: (NSString *) userIdentifier){
    dispatch_async(self.methodQueue, ^{
        [UserExperior setUserIdentifier:userIdentifier];
    });
}

RCT_EXPORT_METHOD(startScreen: (NSString *) screenName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior startScreenWithName:screenName];
    });
}
    
RCT_EXPORT_METHOD(resumeRecording){
    dispatch_async(self.methodQueue, ^{
        [UserExperior resumeRecording];
    });
}
 
RCT_EXPORT_METHOD(pauseRecording){
    dispatch_async(self.methodQueue, ^{
        [UserExperior pauseRecording];
    });
}

RCT_EXPORT_METHOD(stopRecording){
    dispatch_async(self.methodQueue, ^{
        [UserExperior stopRecording];
    });
}

RCT_EXPORT_METHOD(addInSecureViewBucket: (nonnull NSNumber *) tag) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView* view = [self.bridge.uiManager viewForReactTag:tag];
        [UserExperior markSensitiveViewsWithViewToSecure:@[view]];
    });
}

RCT_EXPORT_METHOD(removeFromSecureViewBucket: (nonnull NSNumber *) tag) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView* view = [self.bridge.uiManager viewForReactTag:tag];
        [UserExperior unmarkSensitiveViewsWithViewToUnBlock:@[view]];
    });
}

RCT_EXPORT_METHOD(consent){
    dispatch_async(self.methodQueue, ^{
        [UserExperior displayConsentRequest];
    });
}

RCT_EXPORT_METHOD(optIn){
    dispatch_async(self.methodQueue, ^{
        [UserExperior consentOptIn];
    });
}

RCT_EXPORT_METHOD(optOut){
    dispatch_async(self.methodQueue, ^{
        [UserExperior consentOptOut];
    });
}

RCT_EXPORT_METHOD(startTimer: (NSString *) timerName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior startTimerWithName:timerName];
    });
}

RCT_EXPORT_METHOD(endTimer: (NSString *) timerName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior stopTimerWithName:timerName];
    });
}

RCT_EXPORT_METHOD(endTimer:(NSString*)timerName withProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior stopTimerWithName:timerName properties:properties];
}

RCT_EXPORT_METHOD(setUserProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior setUserProperties:properties];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName)
{
    [UserExperior logEventWithName:eventName];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName withProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior logEventWithName:eventName properties:properties];
}

RCT_EXPORT_METHOD(logMessage:(NSString*)messageName)
{
    [UserExperior logMessageWithName:messageName];
}

RCT_EXPORT_METHOD(logMessage:(NSString*)messageName withProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior logMessageWithName:messageName properties:properties];
}

// using Callbacks
RCT_EXPORT_METHOD(getOptOutStatus:(RCTResponseSenderBlock)callback){
  BOOL status = ![UserExperior consentState];
  callback(@[[NSNull null], [NSNumber numberWithBool:status]]);
}

RCT_EXPORT_METHOD(isRecording:(RCTResponseSenderBlock)callback){
  BOOL status = [UserExperior isRecording];
  callback(@[[NSNull null], [NSNumber numberWithBool:status]]);
}

@end
  
