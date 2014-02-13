//
//  OBLFacebookQuery.h
//  SampleFacebookCode
//
//  Created by Pushparaj Zala on 2/11/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "OBLFacebookUser.h"
#import "OBLFacebookFriend.h"

//complition block having output user data or error if any.
typedef void (^CompletionBlock)(OBLFacebookUser *result,
                                NSError *error);

//complition block having output friend data or error if any.
typedef void (^CompletionFriendBlock)(OBLFacebookFriend *result,
                                NSError *error);

//complition block having output all the friend data in array or error if any.
typedef void (^CompletionFriendAll)(NSArray *result,
                                      NSError *error);

@interface OBLFacebookQuery : NSObject

//fatch user data and return the object of OBLfacebookUser class with detail and error if any.
+ (void)fetchUserProfileWithCompletionHandler:(CompletionBlock)block;

//returns all the friends.
+ (NSArray *)allFriends;

//fatch all the friends profile data with completion handler. Returns array of the OBLFacebookFriend object.
+ (void)fetchFriendsProfileWithCompletionHandler:(CompletionFriendAll)block;

//fatch user's friends' data and return the object of OBLfacebookUser class with detail and error if any.
+ (void)fetchFriendsProfile:(NSArray *)facebookId withCompletionHandler:(CompletionFriendBlock)block;

@end