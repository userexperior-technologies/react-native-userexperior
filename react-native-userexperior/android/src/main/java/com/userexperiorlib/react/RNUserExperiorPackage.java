
package com.userexperiorlib.react;

import android.util.Log;
import android.view.View;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.uimanager.NativeViewHierarchyManager;
import com.facebook.react.uimanager.UIBlock;
import com.facebook.react.uimanager.UIManagerModule;
import com.facebook.react.uimanager.ViewManager;
import com.facebook.react.bridge.JavaScriptModule;
import com.userexperior.UserExperior;
import com.userexperior.utilities.SecureViewBucket;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableType;
import com.facebook.react.bridge.ReadableMapKeySetIterator;
import com.facebook.react.bridge.Promise;

public class RNUserExperiorPackage implements ReactPackage {
	
	public RNUserExperiorPackage() {}

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<>();

        modules.add(new RNUserExperiorModule(reactContext));

        return modules;
    }

    // Deprecated RN 0.47
    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }

    private class RNUserExperiorModule extends ReactContextBaseJavaModule {

        RNUserExperiorModule(ReactApplicationContext reactContext) {
            super(reactContext);
        }

        @Override
        public String getName() {
            return "UserExperior";
        }

        @ReactMethod
        public void startRecording(String ueSdkAppVersionKey) {
            try {
                UserExperior.startRecording(getReactApplicationContext(), ueSdkAppVersionKey);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void stopRecording() {
            try {
                UserExperior.stopRecording();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void pauseRecording() {
            try {
                UserExperior.pauseRecording();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void resumeRecording() {
            try {
                UserExperior.resumeRecording();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        @ReactMethod
        public void setUserIdentifier(String userIdentifier) {
            try {
                UserExperior.setUserIdentifier(userIdentifier);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void setUserProperties(ReadableMap properties) {
            if(properties != null) {
                HashMap<String, Object> map = new HashMap<String, Object>();

                ReadableMapKeySetIterator iterator = properties.keySetIterator();
                while (iterator.hasNextKey()) {
                    String key = iterator.nextKey();
                    ReadableType type = properties.getType(key);
                    if (type == ReadableType.Boolean) {
                        map.put(key, properties.getBoolean(key));
                    } else if (type == ReadableType.Number) {
                        map.put(key, properties.getDouble(key));
                    } else {
                        map.put(key, properties.getString(key));
                    }
                }
                try {
                    UserExperior.setUserProperties(map);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        @ReactMethod
        public void logEvent(String event) {
            try {
                UserExperior.logEvent(event);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void logEvent(String event, ReadableMap properties) {
            if (properties != null) {

                HashMap<String, Object> map = new HashMap<String, Object>();

                ReadableMapKeySetIterator iterator = properties.keySetIterator();
                while (iterator.hasNextKey()) {
                    String key = iterator.nextKey();
                    ReadableType type = properties.getType(key);
                    if (type == ReadableType.Boolean) {
                        map.put(key, properties.getBoolean(key));
                    } else if (type == ReadableType.Number) {
                        map.put(key, properties.getDouble(key));
                    } else {
                        map.put(key, properties.getString(key));
                    }
                }
                try {
                    UserExperior.logEvent(event, map);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    UserExperior.logEvent(event);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        @ReactMethod
        public void logMessage(String msg) {
            try {
                UserExperior.logMessage(msg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void logMessage(String msg, ReadableMap properties) {
            if (properties != null) {

                HashMap<String, Object> map = new HashMap<String, Object>();

                ReadableMapKeySetIterator iterator = properties.keySetIterator();
                while (iterator.hasNextKey()) {
                    String key = iterator.nextKey();
                    ReadableType type = properties.getType(key);
                    if (type == ReadableType.Boolean) {
                        map.put(key, properties.getBoolean(key));
                    } else if (type == ReadableType.Number) {
                        map.put(key, properties.getDouble(key));
                    } else {
                        map.put(key, properties.getString(key));
                    }
                }
                try {
                    UserExperior.logMessage(msg, map);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    UserExperior.logMessage(msg);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        @ReactMethod
        public void setCustomTag(String customTag, String type){
            try {
                UserExperior.setCustomTag(customTag, type);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void startScreen(String screenName) {
            try {
                UserExperior.startScreen(screenName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void startTimer(String timerName) {
            try {
                UserExperior.startTimer(timerName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void endTimer(String timerName) {
            try {
                UserExperior.endTimer(timerName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void endTimer(String timerName, ReadableMap properties) {
            if (properties != null) {

                HashMap<String, String> map = new HashMap<String, String>();

                ReadableMapKeySetIterator iterator = properties.keySetIterator();
                while (iterator.hasNextKey()) {
                    String key = iterator.nextKey();
                    map.put(key, properties.getString(key));
                }
                try {
                    UserExperior.endTimer(timerName, map);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    UserExperior.endTimer(timerName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        @ReactMethod
        public void setDeviceLocation(double latitude, double longitude) {
            try {
                UserExperior.setDeviceLocation(latitude, longitude);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		@ReactMethod
        public void addInSecureViewBucket(final int id) {
            UIManagerModule uiManager = getReactApplicationContext().getNativeModule(UIManagerModule.class);
            uiManager.addUIBlock(new UIBlock() {
                @Override
                public void execute(NativeViewHierarchyManager nativeViewHierarchyManager) {
                    try {
                        View view = nativeViewHierarchyManager.resolveView(id);
                        if (view != null){
                            SecureViewBucket.addInSecureViewBucket(view);
                        }
                    } catch(Exception e) {
                        Log.d("UserExperior", "addInSecureViewBucket: can't find view by id: " + id);
                    }
                }
            });
        }

        @ReactMethod
        public void removeFromSecureViewBucket(final int id) {
            UIManagerModule uiManager = getReactApplicationContext().getNativeModule(UIManagerModule.class);
            uiManager.addUIBlock(new UIBlock() {
                @Override
                public void execute(NativeViewHierarchyManager nativeViewHierarchyManager) {
                    try {
                        View view = nativeViewHierarchyManager.resolveView(id);
                        if (view != null){
                            SecureViewBucket.removeFromSecureViewBucket(view);
                        }
                    } catch(Exception e) {
                        Log.d("UserExperior", "removeFromSecureViewBucket: can't find view by id: " + id);
                    }
                }
            });
        }
        
        @ReactMethod
        public void optIn() {
            try {
                UserExperior.optIn();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        @ReactMethod
        public void optOut() {
            try {
                UserExperior.optOut();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        @ReactMethod
        public void getOptOutStatus() {
            try {
                UserExperior.getOptOutStatus();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        @ReactMethod
        public void consent() {
            try {
                UserExperior.consent();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        @ReactMethod
        public void isRecording(Promise promise) {
            try {
                promise.resolve(UserExperior.isRecording());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
