'use strict';
var { Platform, NativeModules, findNodeHandle, InteractionManager } = require('react-native');
var UserExperiorBridge = NativeModules.UserExperior;

class UserExperior {

	static startRecording(ueSdkAppVersionKey) {
        if (Platform.OS === 'android') {
            if (!ueSdkAppVersionKey) {
                console.log('UserExperior : startRecording params are invalid');
                return;
            }
            UserExperiorBridge.startRecording(ueSdkAppVersionKey);    
        }
    }

    static stopRecording() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.stopRecording();
        }
    }


    static pauseRecording() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.pauseRecording();
        }
    }

    static resumeRecording() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.resumeRecording();
        }
    }
	
	static setUserIdentifier(userIdentifier) {
        if (Platform.OS === 'android') {
            if (!userIdentifier) {
            console.log('UserExperior : setUserIdentifier params are invalid');
            return;
            }
            UserExperiorBridge.setUserIdentifier(userIdentifier);
        }
    }

    static setCustomTag(customTag, type) {
        if (Platform.OS === 'android') {
            if (!customTag && !type) {
                console.log('UserExperior : setCustomTag params are invalid');
                return;
            }
            UserExperiorBridge.setCustomTag(customTag, type);
        }
    }


    static startScreen(screenName) {
        if (Platform.OS === 'android') {
            if (!screenName) {
                console.log('UserExperior : startScreen params are invalid');
                return;
            }
            UserExperiorBridge.startScreen(screenName);
    }
    }
	
	static startTimer(timerName) {
        if (Platform.OS === 'android') {
            if (!timerName) {
                console.log('UserExperior : startTimer params are invalid');
                return;
            }
            UserExperiorBridge.startTimer(timerName);
        }
    }
	
	static endTimer(timerName) {
        if (Platform.OS === 'android') {
            if (!timerName) {
                console.log('UserExperior : endTimer params are invalid');
                return;
            }
            UserExperiorBridge.endTimer(timerName);
        }
    }

    static setDeviceLocation(latitude, longitude) {
        if (Platform.OS === 'android') {
            if (latitude == null ||
                longitude == null) {
                console.log('UserExperior : setDeviceLocation params are invalid');
                return;
            }
            UserExperiorBridge.setDeviceLocation(latitude, longitude);
        
        }
    }
	
	static addInSecureViewBucket(ref) {
        if (Platform.OS === 'android') {
            if (ref == null) {
                console.log('UserExperior : Can\'t add a null ref to secure view bucket (are you sure the component has a ref?)');
                return;
            }
    
            UserExperiorBridge.addInSecureViewBucket(findNodeHandle(ref));
            console.log('UserExperior: masking done!!!!!!!!!!!!!!!!!!!!!!!!');
        }
    }

    static removeFromSecureViewBucket(ref) {
        if (Platform.OS === 'android') {
            if (ref == null) {
                console.log('UserExperior : Can\'t remove a null ref from secure view bucket (are you sure the component has a ref?)');
                return;
            }
            
            UserExperiorBridge.removeFromSecureViewBucket(findNodeHandle(ref));
        }
    }

    static optIn() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.optIn();
        }  
    }

    static optOut() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.optOut();
        }  
    }

    static getOptOutStatus() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.getOptOutStatus();
        }  
    }

    static consent() {
        if (Platform.OS === 'android') {
            UserExperiorBridge.consent();
        }  
    }
}

module.exports = UserExperior;