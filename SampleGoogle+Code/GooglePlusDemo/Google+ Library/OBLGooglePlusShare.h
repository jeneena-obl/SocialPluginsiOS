//
//  OBLGooglePlusShare.h
//  Google+Demo
//
//  Created by Jeneena Jose on 2/17/14.
//  Copyright (c) 2014 Jeneena Jose. All rights reserved.
//
//Can be used for sharing post by the user.
//

#import <Foundation/Foundation.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <GooglePlus/GooglePlus.h>
#import "GPPost.h"
#import "OBLGooglePlusShareDelegate.h"
#import "OBLLog.h"

@interface OBLGooglePlusShare : NSObject <GPPost,GPPShareDelegate>


// The object to be notified when sharing is finished.
@property(nonatomic, weak) id <OBLGooglePlusShareDelegate> delegate;


// Returns a shared |OBLGooglePlusShare| instance.
+ (OBLGooglePlusShare  *)sharedInstance;

//To share a post with given URL.
- (void) shareStatus:(NSString *)status withURL:(NSString *)url;

//To share an interactive post with given URL and callToActionLabel.
- (void) shareInteractivePost:(NSString *)status withURL:(NSString *)url withCallToActionLabel:(NSString *)label;

//To share a post with given title,description and imageUrl.
- (void) shareInteractivePost:(NSString *)status withTitle:(NSString *)title addDescription:(NSString *)description andImageURL:(NSString *)imageUrl;

@end
