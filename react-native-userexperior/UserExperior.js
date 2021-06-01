'use strict';
var { NativeModules, findNodeHandle, InteractionManager } = require('react-native');
var UserExperiorBridge = NativeModules.UserExperior;

class UserExperior {

	static startRecording(ueSdkAppVersionKey) {
        if (!ueSdkAppVersionKey) {
            console.log('UserExperior : startRecording params are invalid');
            return;
        }
        UserExperiorBridge.startRecording(ueSdkAppVersionKey);    
    }

    static stopRecording() {
        UserExperiorBridge.stopRecording();
    }


    static pauseRecording() {
        UserExperiorBridge.pauseRecording();
    }

    static resumeRecording() {
        UserExperiorBridge.resumeRecording();
    }
	
	static setUserIdentifier(userIdentifier) {
        if (!userIdentifier) {
            console.log('UserExperior : setUserIdentifier params are invalid');
            return;
        }
        UserExperiorBridge.setUserIdentifier(userIdentifier);
    }

    static setUserProperties(properties) {
        UserExperiorBridge.setUserProperties(properties);
    }

    static logEvent(eventName) {
        if (!eventName) {
            console.log('UserExperior : eventName param is invalid');
            return;
        }
        UserExperiorBridge.logEvent(eventName);
    }

    static logEvent(eventName, properties) {
        if(typeof properties !== "undefined" || properties !== null){
            UserExperiorBridge.logEvent(eventName, properties);
        } else {
            UserExperiorBridge.logEvent(eventName);
        }
    }

    static logMessage(messageName) {
        if (!messageName) {
            console.log('UserExperior : messageName param is invalid');
            return;
        }
        UserExperiorBridge.logMessage(messageName);
    }

    static logMessage(messageName, properties) {
        if(typeof properties !== "undefined" || properties !== null){
            UserExperiorBridge.logMessage(messageName, properties);
        } else {
            UserExperiorBridge.logMessage(messageName);
        }
    }

    static setCustomTag(customTag, type) {
        if (!customTag && !type) {
            console.log('UserExperior : setCustomTag params are invalid');
            return;
        }
        UserExperiorBridge.setCustomTag(customTag, type);
    }


    static startScreen(screenName) {
        if (!screenName) {
            console.log('UserExperior : startScreen params are invalid');
            return;
        }
        UserExperiorBridge.startScreen(screenName);
    }
	
	static startTimer(timerName) {
        if (!timerName) {
            console.log('UserExperior : startTimer params are invalid');
            return;
        }
        UserExperiorBridge.startTimer(timerName);
    }
	
	static endTimer(timerName) {
        if (!timerName) {
            console.log('UserExperior : endTimer params are invalid');
            return;
        }
        UserExperiorBridge.endTimer(timerName);
    }

    static endTimer(timerName, properties) {
        if(typeof properties !== "undefined" || properties !== null){
            UserExperiorBridge.endTimer(timerName, properties);
        } else {
            UserExperiorBridge.endTimer(timerName);
        }
    }

    static setDeviceLocation(latitude, longitude) {
        if (latitude == null ||
            longitude == null) {
            console.log('UserExperior : setDeviceLocation params are invalid');
            return;
        }
        UserExperiorBridge.setDeviceLocation(latitude, longitude);   
    }
	
	static addInSecureViewBucket(ref) {
        if (ref == null) {
            console.log('UserExperior : Can\'t add a null ref to secure view bucket (are you sure the component has a ref?)');
            return;
        }

        UserExperiorBridge.addInSecureViewBucket(findNodeHandle(ref));
        console.log('UserExperior: masking done!!!!!!!!!!!!!!!!!!!!!!!!');
    }

    static removeFromSecureViewBucket(ref) {
        if (ref == null) {
            console.log('UserExperior : Can\'t remove a null ref from secure view bucket (are you sure the component has a ref?)');
            return;
        }
        
        UserExperiorBridge.removeFromSecureViewBucket(findNodeHandle(ref));
    }

    static optIn() {
        UserExperiorBridge.optIn();
    }

    static optOut() {
        UserExperiorBridge.optOut();
    }

    static getOptOutStatus() {
        UserExperiorBridge.getOptOutStatus();
    }

    static consent() {
        UserExperiorBridge.consent();

    }

    static isRecording() {
        UserExperiorBridge.isRecording();
    }
}

module.exports = UserExperior;