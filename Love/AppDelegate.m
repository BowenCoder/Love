//
//  AppDelegate.m
//  Love
//
//  Created by Bowen on 17/2/17.
//  Copyright © 2017年 Bowen. All rights reserved.
//

#import "AppDelegate.h"
#import "HTTPServer.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "ViewController.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface AppDelegate ()

@property (nonatomic, strong) HTTPServer *httpServer;

@end

@implementation AppDelegate

- (void)startServer
{
    // Start the server (and check for problems)
    
    NSError *error;
    if([self.httpServer start:&error])
    {
        DDLogInfo(@"Started HTTP Server on port %hu", [self.httpServer listeningPort]);
    }
    else
    {
        DDLogError(@"Error starting HTTP Server: %@", error);
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    self.httpServer = [[HTTPServer alloc] init];
    [self.httpServer setPort:12345];

    [self.httpServer setType:@"_http._tcp."];
    NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
    DDLogInfo(@"Setting document root: %@", webPath);
    [self.httpServer setPort:12345];
    [self.httpServer setDocumentRoot:webPath];
    [self startServer];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
