//
//  CheckingVC.h
//  Google+Demo
//
//  Created by Jeneena Jose on 2/13/14.
//  Copyright (c) 2014 Jeneena Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBLGooglePlusLogin.h"
#import "OBLGooglePlusUser.h"
#import "OBLGooglePlusQuery.h"
#import "OBLGooglePlusLoginDelegate.h"
#import "OBLGooglePlusShare.h"
#import "OBLGooglePlusShareDelegate.h"

@interface CheckingVC : UIViewController  <OBLGooglePlusLoginDelegate,OBLGooglePlusShareDelegate>

@property (weak, nonatomic) IBOutlet UIButton *signIn;
@property (weak, nonatomic) IBOutlet UIButton *signOut;
@property (weak, nonatomic) IBOutlet UIButton *disconnect;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end
