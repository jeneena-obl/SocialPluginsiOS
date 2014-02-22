SocialPluginsiOS
================

Social media plugins for iOS

Introduction
------------

SocialPluginsiOS provides integration with Facebook, Google+ and Twitter in iOS in the simplest and easiest way.

It has different libraries for Facebook, Google+ and Twitter, so you can use any of them or all at the same time.

## Features

Facebook Library:
* Login/Logout with facebook in your application. (with different permissions)
* Fetch facebook user's profile.
* Request for additional facebook permissions.
* Post feed status in user's wall.
* Fetch facebook user's friends and their profile.
* Provides functinality to turn debugging ON or OFF (Log message makes easy to locate error).

Google+ Library:
*Sign in and Sign out with Google+ in your application
*Share posts with friends
*Fetch signed in user's profile details.
*Fetch user's Google+ friend's profile information.
*Provides functionality of debugging.Logging messages can be activated as ON or OFF.
 
Twitter Library:

## Requirements 

* iOS 6.1 through iOS 7.0 or later.
* ARC memory management.

## Adding library to project

### Source files

steps to include library to project:

1. Download the Library folder from (https://github.com/ObjectLounge/SocialPluginsiOS).
2. Open your project in Xcode, then drag and drop Library folders(as mentioned below) that you need in your project. Make sure to select Copy items when asked if you extracted the code archive outside of your project.
  - Add Protocol and Utility folder
  - Add FacebookLibrary for facebook integration
  - Add Google+ Library for Google+ integration
  - Add TwitterLibrary for Twitter integration

3. Include library files wherever you need it like `#import "OBLFacebookogin.h"`.

## APIs documentation

####FacebookLibrary:

You can see the demo code present in SampleFacebookCode Folder.

Login/Logout:
* `OBLFacebookLogin`
  - Refer to **[OBLFacebookLogin.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookLogin.h)**
  - FacebookLoging class provide basic utilities for the facebook like login, logout, loging with permissions.
  - Request new read or publish permission.
  - User has to call handleOpenUrl:url in the application:openURL:sourceApplication:annotation: of UIApplicationDelegate... for handling incoming url like `[OBLFacebookLogin handleOpenUrl:(NSURL *)url];`
  - Also call applicationActiveHandle in applicationDidBecomeActive:application for updating session info like `[OBLFacebookLogin applicationActiveHandle];`

* `OBLFacebookPermission`
  - Refer to **[OBLFacebookPermission.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookPermission.h)**
  - List all the Facebook Permissions that can be used with this library.

Social media query (Fetch data):

* `OBLFacebookQuey`
  - Refer to **[OBLFacebookQuery.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookQuery.h)**
  - Class fetches the user and user's friends' profile.

Social media posting:

* `OBLFacebookPost`
  - Refer to **[OBLFacebookPost.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookPost.h)**
  - This class allows user to post on user's wall.


Profile details:

* `OBLFacebookUser`
  - Refer to **[OBLFacebookUser.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookUser.h)**
  - Main class having all profile information of facebook user

* `OBLFacebookFriend`
  - Refer to **[OBLFacebookFriend.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/FacebookLibrary/OBLFacebookFriend.h)**
  - Class having all profile information of facebook friend

Log (Debug):

* `OBLLog`
  - Refer to **[OBLLog.h](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/Library/Utility/OBLLog.h)**
  - Call this class and set facebookDebug to YES to turn on the error logs like `[OBLLog setFacebookDebug:YES];`

####Google+ Library:

####Twitter Library:


## Usage

####FacebookLibrary:

* You can see the demo code present in SampleFacebookCode Folder.

#####Initial setup:

1. Create app on facebook.
2. Make changes in your project's .plist file : Add FacebookAppID, FacebookDisplayName. Also create new row URL types, under that create URL Schemes and add value fb{FacebookAppID}.
3. Download and include Library folder inside project.
4. Call handleOpenUrl:url from your main application method application:openURL:sourceApplication:annotation: of UIApplicationDelegate... for handling incoming url like 
```
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // Note this handler block should be the exact same as the handler passed to any open calls.
    return [OBLFacebookLogin handleOpenUrl:(NSURL *)url];
}
```
  - Also call applicationActiveHandle from your main application method applicationDidBecomeActive:application for updating session info like `[OBLFacebookLogin applicationActiveHandle];`
```
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [OBLFacebookLogin applicationActiveHandle];
}
```
#####Using FacebookLibrary:
* Refer this file **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** of FacebookSampleCode to understand how to use FacebookLibrary. Check sample calls to FacebookLibrary present in the code.

Login/Logout:

  - Call any login class method of `OBLFacebookLogin`.

  - Refer `login` method in **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** file

  - For logout call `logout` mehod of `OBLFacebookLogin`:
```
    [OBLFacebookLogin logout];
```
  - Refer `logout` method in **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** file

Request new permission:

  - Refer `request` method in **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** file

Fetch user's data:

  - Refer `fatchDetails` method in **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** file

Post on user's wall:

  - Refer `post` method in **[FacebookViewController.m](https://github.com/ObjectLounge/SocialPluginsiOS/blob/beta/SampleFacebookCode/SampleFacebookCode/Controller/FacebookViewController.m)** file

####Google+ Library:

####Twitter Library:
