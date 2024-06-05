
#import "RNUserExperior.h"
@import UserExperiorSDK;

#import <React/RCTUIManager.h>
#import <React/RCTUIManagerUtils.h>

static NSString* const RN_ON_USER_EXPERIOR_STARTED = @"ON_USER_EXPERIOR_STARTED";

@interface RNUserExperior() <UserExperiorDelegate>
@property (atomic, assign) NSInteger numEventListeners;
@end

@implementation RNUserExperior

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(UserExperior)

RCT_EXPORT_METHOD(startRecording: (NSString *) versionKey withFw: (NSString *) fw withSv: (NSString *) sv) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior startRecordingWithVersionKey:versionKey fw:fw sv:sv];
        [UserExperior setDelegate:self];
    });
}

RCT_EXPORT_METHOD(setUserIdentifier: (NSString *) userIdentifier) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior setUserIdentifier:userIdentifier];
    });
}

RCT_EXPORT_METHOD(startScreen: (NSString *) screenName) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior startScreenWithName:screenName];
    });
}
    
RCT_EXPORT_METHOD(resumeRecording) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior resumeRecording];
    });
}
 
RCT_EXPORT_METHOD(pauseRecording){ 
    dispatch_async(self.methodQueue, ^{
        [UserExperior pauseRecording];
    });
}

RCT_EXPORT_METHOD(stopRecording) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior stopRecording];
    });
}

RCT_EXPORT_METHOD(addInSecureViewBucket: (id) tag) {
	NSNumber* reactTag = [self tagNumberFromTag:tag];
	if (reactTag) {
		dispatch_async(RCTGetUIManagerQueue(), ^
					   {
			[self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry)
			 {
				UIView* view = viewRegistry[reactTag];
				if (view) {
					[UserExperior markSensitiveViewsWithViewToSecure:@[view]];
				} else {
					NSLog(@"RNUserExperior:addInSecureViewBucket - Unable to find view for reactTag %@", reactTag);
				}
			}];
		});
	} else {
		NSLog(@"RNUserExperior:addInSecureViewBucket - Unable to find reactTag from %@", tag);
	}
}


RCT_EXPORT_METHOD(removeFromSecureViewBucket: (id) tag) {
	NSNumber* reactTag = [self tagNumberFromTag:tag];
	if (reactTag) {
		dispatch_async(RCTGetUIManagerQueue(), ^
					   {
			[self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry)
			 {
				UIView* view = viewRegistry[reactTag];
				if (view) {
					[UserExperior unmarkSensitiveViewsWithViewToUnBlock:@[view]];
				} else {
					NSLog(@"RNUserExperior:removeFromSecureViewBucket - Unable to find view for reactTag %@", reactTag);
				}
			}];
		});
	} else {
		NSLog(@"RNUserExperior:removeFromSecureViewBucket - Unable to find reactTag from %@", tag);
	}
}

RCT_EXPORT_METHOD(optIn) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior consentOptIn];
    });
}

RCT_EXPORT_METHOD(optOut) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior consentOptOut];
    });
}

RCT_EXPORT_METHOD(startTimer: (NSString *) timerName) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior startTimerWithName:timerName properties:@{}];
    });
}

RCT_EXPORT_METHOD(startTimer:(NSString*)timerName withProperties:(nullable NSDictionary<NSString*, id>*)properties) {
    [UserExperior startTimerWithName:timerName properties:properties];
}

RCT_EXPORT_METHOD(endTimer: (NSString *) timerName) {
    dispatch_async(self.methodQueue, ^{
        [UserExperior endTimerWithName:timerName properties:@{}];
    });
}

RCT_EXPORT_METHOD(endTimer:(NSString*)timerName withProperties:(nullable NSDictionary<NSString*, id>*)properties) {
    [UserExperior endTimerWithName:timerName properties:properties];
}

RCT_EXPORT_METHOD(setUserProperties:(nullable NSDictionary<NSString*, id>*)properties) {
    [UserExperior setUserProperties:properties];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName) {
    [UserExperior logEventWithName:eventName];
}

RCT_EXPORT_METHOD(logEvent:(NSString*)eventName withProperties:(nullable NSDictionary<NSString*, id>*)properties) {
    [UserExperior logEventWithName:eventName properties:properties];
}

// using Promise
RCT_EXPORT_METHOD(getOptOutStatus:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL status = [UserExperior getOptOutStatus];
    NSNumber *boolNumber = [NSNumber numberWithBool:status];
    resolve(boolNumber);
}

RCT_EXPORT_METHOD(isRecording:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    BOOL status = [UserExperior isRecording];
    NSNumber *boolNumber = [NSNumber numberWithBool:status];
    resolve(boolNumber);
}


RCT_EXPORT_METHOD(getSessionUrl:(NSString*)tpName :(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *url = [UserExperior getSessionUrlWithPlatformName:tpName];
    if (url) {
        resolve(url);
    } else {
        NSString *code = @"no_url";
        NSString *message = @"Could not retrieve the url for the current session.";
        NSError *error = [NSError errorWithDomain:@"RNUE" code:2 userInfo:nil];
        
        reject(code, message, error);
    }
}

#pragma mark Event related methods
- (NSArray<NSString *> *)supportedEvents
{
    return @[RN_ON_USER_EXPERIOR_STARTED];
}

/// Will be called when this module's first listener is added.
-(void)startObserving {
    if (self.numEventListeners == 0) {
        self.numEventListeners++;
        [self senderVerification:YES];
    }
}

-(void)stopObserving {
    
}

- (void)senderVerification:(BOOL)result {
    if (self.numEventListeners > 0) {
        [self sendEventWithName:RN_ON_USER_EXPERIOR_STARTED body:@(YES)];
    }
}

- (void)userExperiorSessionDidStart {
    if (self.numEventListeners > 0) {
        [self senderVerification:YES];
    }
}

- (NSNumber*)tagNumberFromTag:(id)tag {
	NSNumber* reactTag = nil;
	if ([tag isKindOfClass:NSDictionary.class]) {
		reactTag = tag[@"_nativeTag"];
	} else if ([tag isKindOfClass:NSNumber.class]) {
		reactTag = tag;
	}

	return reactTag;
}

@end
  
