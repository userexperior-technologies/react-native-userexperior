
#import "RNUserExperior.h"
#import "UserExperior-Swift.h"
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
        [UserExperior initialize:versionKey];
    });
}

RCT_EXPORT_METHOD(setCustomTag: (NSString *) customTag customType: (NSString *) customType){
    dispatch_async(self.methodQueue, ^{
        [UserExperior setCustomTagWithString:customTag customType:customType];
    });
}

RCT_EXPORT_METHOD(setUserIdentifier: (NSString *) userIdentifier){
    dispatch_async(self.methodQueue, ^{
        [UserExperior setUserIdentifier:userIdentifier];
    });
}

RCT_EXPORT_METHOD(startScreen: (NSString *) screenName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior startScreen:screenName];
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
        [UserExperior markViewAsSensitive:view];
    });
}

RCT_EXPORT_METHOD(removeFromSecureViewBucket: (nonnull NSNumber *) tag) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView* view = [self.bridge.uiManager viewForReactTag:tag];
        [UserExperior unmarkViewAsSensitive:view];
    });
}

RCT_EXPORT_METHOD(consent){
    dispatch_async(self.methodQueue, ^{
        [UserExperior consent];
    });
}

RCT_EXPORT_METHOD(optIn){
    dispatch_async(self.methodQueue, ^{
        [UserExperior optIn];
    });
}

RCT_EXPORT_METHOD(optOut){
    dispatch_async(self.methodQueue, ^{
        [UserExperior optOut];
    });
}

RCT_EXPORT_METHOD(startTimer: (NSString *) timerName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior startTimer:timerName];
    });
}

RCT_EXPORT_METHOD(endTimer: (NSString *) timerName){
    dispatch_async(self.methodQueue, ^{
        [UserExperior stopTimer:timerName];
    });
}

RCT_EXPORT_METHOD(setUserProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior setUserProperties:properties];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName)
{
    [UserExperior logEvent:eventName];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName withProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior logEvent:eventName properties:properties];
}

RCT_EXPORT_METHOD(logMessage:(NSString*)messageName)
{
    [UserExperior logMessage:messageName];
}

RCT_EXPORT_METHOD(logMessage:(NSString*)messageName withProperties:(nullable NSDictionary<NSString*, id>*)properties)
{
    [UserExperior logMessage:messageName properties:properties];
}



// using Callbacks
RCT_EXPORT_METHOD(getOptOutStatus:(RCTResponseSenderBlock)callback){
  BOOL status = [UserExperior getOptOutStatus];
  callback(@[[NSNull null], [NSNumber numberWithBool:status]]);
}

/*
// using Promises
RCT_REMAP_METHOD(getOptOutStatus, findEventsWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
 BOOL status = [UserExperior getOptOutStatus];
  if(status == TRUE) {
    resolve([NSNumber numberWithBool:status]);
  } else {
    reject([NSNumber numberWithBool:status]);
  }
}
*/


@end
  
