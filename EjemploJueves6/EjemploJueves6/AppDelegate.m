//
//  AppDelegate.m
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "MapViewController.h"
#import "Localizacion.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self altaEnParse];
    [self altaEnTwitter];
    
    MapViewController  *mvc= [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mvc];
    
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)altaEnParse {
    
    [Localizacion registerSubclass];
    [Parse setApplicationId:@"0ObDb41DGDpqnMNm5Qkmm29TowoBfQZhaSGVUqow" clientKey:@"SIqUs8b85TgoNmRGzTKs0XqvJlu2B07iyvHqASlW"];
    
}

-(void)altaEnTwitter {
    
    
//    [PFTwitterUtils initializeWithConsumerKey:@"2227222836-tXR1Sac7rrrFDATeInvuitIoQRJGFnIqpyTxvE1"
//                               consumerSecret:@"BimFbmqEcET0yv1veMc4uuj7X4wSxYZmFLM7925sDc54D"];
    
    [PFTwitterUtils initializeWithConsumerKey:@"ayv8CPYDZj9wS959Xg5Dg"
                                   consumerSecret:@"ZkkmCYRxNOV7LNB24QWs09Nss1iIdcxranaqByU"];

    

    

}

@end
