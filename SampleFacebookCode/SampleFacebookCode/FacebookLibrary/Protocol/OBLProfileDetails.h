//
//  OBLProfileDetails.h
//  SampleFacebookCode
//
//  Created by Pushparaj Zala on 2/11/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.
//

//Abstract class for Profile details of user.

#import <Foundation/Foundation.h>

@protocol ProfileDetails

//unique social media id of user - may be facebook id or google plus id
@property (nonatomic,strong) NSString *socialMediaId;

//name of user.
@property (nonatomic,strong) NSString *name;

@end

@interface OBLProfileDetails : NSObject


@end