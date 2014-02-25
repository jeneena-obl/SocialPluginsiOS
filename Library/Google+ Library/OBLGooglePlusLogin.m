//
//  OBLGooglePlusLogin.m
//  GooglePlusDemo
//
//  Created by Jeneena Jose on 2/11/14.
//  Copyright (c) 2014 Jeneena Jose. All rights reserved.
//

#import "OBLGooglePlusLogin.h"

@implementation OBLGooglePlusLogin

#pragma mark - Setters and Getters

@synthesize loginUsingInstalledApp = _loginUsingInstalledApp;
@synthesize clientID = _clientID;
@synthesize scopes = _scopes;
@synthesize actions = _actions;
@synthesize shouldFetchGooglePlusUser = _shouldFetchGooglePlusUser;
@synthesize shouldFetchGoogleUserID = _shouldFetchGoogleUserID;

-(void) setClientID:(NSString *)clientID
{
    _clientID = clientID;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.clientID = self.clientID;
}

-(void) setScopes:(NSArray *)scopes
{
    _scopes = scopes;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.scopes = self.scopes;
}

-(void) setActions:(NSArray *)actions{
    _actions = actions;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.actions = self.actions;
}

-(void) setShouldFetchGooglePlusUser:(BOOL)shouldFetchGooglePlusUser
{
    _shouldFetchGooglePlusUser = shouldFetchGooglePlusUser;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = self.shouldFetchGooglePlusUser;
}

- (void) setShouldFetchGoogleUserEmail:(BOOL)shouldFetchGoogleUserEmail
{
    _shouldFetchGoogleUserEmail = shouldFetchGoogleUserEmail;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGoogleUserEmail = self.shouldFetchGoogleUserEmail;
}

-(void) setShouldFetchGoogleUserID:(BOOL)shouldFetchGoogleUserID
{
    _shouldFetchGoogleUserID = shouldFetchGoogleUserID ;
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGoogleUserID = self.shouldFetchGoogleUserID;

}
-(void) setLoginUsingInstalledApp:(BOOL)loginUsingInstalledApp
{
    _loginUsingInstalledApp = loginUsingInstalledApp;
    [GPPSignIn sharedInstance].attemptSSO = self.loginUsingInstalledApp;
}

#pragma mark - Singleton Instantiation

static OBLGooglePlusLogin * _sharedInstance = nil;

//Creates a singleton of OBLGooglePlusLogin.
+ (OBLGooglePlusLogin  *)sharedInstance
{
    @synchronized([OBLGooglePlusLogin class])
    {
        if (!_sharedInstance)   _sharedInstance = [[self alloc] init];
        
        return _sharedInstance;
    }
    
    return nil;
}

#pragma mark -  Silent Authentication

//Tries to authenticate the already logged in user.
- (BOOL)trySilentAuthentication
{
    return  [[GPPSignIn sharedInstance] trySilentAuthentication];
}

#pragma mark - Log in

//Returns error if clientID or scope is not set
- (NSError *) login
{
    NSError *err;
    
    if(!self.clientID)
    {
        NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey : @"Client ID not specified"};
        err = [[NSError alloc] initWithDomain:@"google+signin"  code:-1 userInfo:errorDictionary];
    }
    else if(!self.scopes)
    {
        NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey : @"Scopes are not specified"};
        err = [[NSError alloc] initWithDomain:@"google+signin"  code:-1 userInfo:errorDictionary];
    }
    else
    {
        GPPSignIn *signIn = [GPPSignIn sharedInstance];
        signIn.delegate = self;
        [signIn authenticate];
        err = nil;
    }
    return err;
}

//Called after login to show authenication result.
- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error
{
    NSError *err;

    if(error.code == -1)
    {
        NSDictionary *errorDictionary = @{ NSLocalizedDescriptionKey : @"User has cancelled sign in process"};
        err = [[NSError alloc] initWithDomain:@"google+signin"  code:-1 userInfo:errorDictionary];
    }
    else
    {
        err = error;
    }

    if(auth)
    {
        self.authentication =auth;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(finishedWithLogin:)])
    {
        [self.delegate finishedWithLogin:err ];
    }
}

#pragma mark - Log Out

//Returns YES if user is successfully logged out.
- (BOOL) logout
{
    [[GPPSignIn sharedInstance] signOut];
    
    if(( self.authentication=[GPPSignIn sharedInstance].authentication) == nil)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - Disconnect

- (void)disconnect
{
    [[GPPSignIn sharedInstance] disconnect];
}

//Called after disconnect to show error or not while disconnecting .
- (void)didDisconnectWithError:(NSError *)error
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didDisconnectWithError:)])
    {
        [self.delegate didDisconnectWithError:error];
    }

}


#pragma mark - HandleUrl

//To be called from AppDelegate
- (BOOL)handleURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication  annotation:(id)annotation;
{
    return [GPPURLHandler handleURL:url
                  sourceApplication:sourceApplication
                         annotation:annotation];
}

@end
