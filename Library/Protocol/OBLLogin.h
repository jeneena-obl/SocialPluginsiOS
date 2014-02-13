//
//  Login.h
//  FacebookLibrary
//
//  Created by Pushparaj Zala on 2/7/14.
//  Copyright (c) 2014 Pushparaj Zala. All rights reserved.

//Abstract class for login and logout.
//Library for login should implement login protocol.

#import <Foundation/Foundation.h>

/*login protocol for login and logout function*/
@protocol login

/*logion method - force subclass to implement login functionality*/
+ (NSError *)login;

/*logout method - force subclass to implement logout functionality*/
+ (BOOL)logout;

@end

@interface OBLLogin : NSObject

@end
