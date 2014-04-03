//
//  MapViewController.m
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import <Parse/Parse.h>
#import "MapViewController.h"
#import "locationViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;


- (void)viewDidLoad
{
    [super viewDidLoad];

    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    locationManager.distanceFilter = kCLDistanceFilterNone;
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
        
    }
    
    //añado el tap
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    tapRecognizer.numberOfTouchesRequired = 1;
    
    [self.mapView addGestureRecognizer:tapRecognizer];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser]) {
        // If the user is logged in, show their name in the welcome label.
        
        if ([PFTwitterUtils isLinkedWithUser:[PFUser currentUser]]) {
               NSLog(@"Usuario de Twitter logeado: %@",[PFTwitterUtils twitter].screenName) ;
            
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    //if (![PFUser currentUser]) {
        

    [self showLogingProcess];
    
    [PFUser logOut];
    
    

//            [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
//                if (!user) {
//                    // El usuario ha cancelado el login mediante Facebook.
//                    NSLog(@"Uh oh. The user cancelled the Twitter login.");
//                    return;
//                } else if (user.isNew) {
//                    NSLog(@"User signed up and logged in with Twitter!");
//                } else {
//                    // El usuario ya existía y se ha logado mediante Facebook.
//                    NSLog(@"User logged in with Twitter!");
//                }
//            }];
    
//    if (![PFTwitterUtils isLinkedWithUser:[PFUser currentUser]]) {
//        [PFTwitterUtils linkUser:[PFUser currentUser] block:^(BOOL succeeded, NSError *error) {
//            if ([PFTwitterUtils isLinkedWithUser:[PFUser currentUser]]) {
//                NSLog(@"Woohoo, user logged in with Twitter!");
//            }
//        }];
//    }
    //}
    
}

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    
    [locationManager stopUpdatingLocation]; //para la localizacion
    
    latitud = newLocation.coordinate.latitude;
    longitud = newLocation.coordinate.longitude;
    
    //PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:<#(double)#> longitude:<#(double)#>;
    //almacenamos los datos en un objeto especial
    CLLocationCoordinate2D initialLocation;
    initialLocation.latitude = latitud;
    initialLocation.longitude = longitud;
    
    
    
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(initialLocation, 100, 100);
    
    [mapView setRegion:region animated:YES];
    
    NSLog(@"Localización: %f , %f", initialLocation.latitude, initialLocation.longitude);
    
    
}

-(void)foundTap:(UITapGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.view];
    
    NSLog(@"Coordenadas: x %f --- y %f", tapPoint.latitude, tapPoint.longitude);
    
    locationViewController *locationVC = [[locationViewController alloc] initWithCoordenates:tapPoint];
    
    [self.navigationController pushViewController:locationVC animated:YES];
    

}

#pragma mark - Protocolo de Login del Parse

-(void)showLogingProcess{
    
    if(![PFUser currentUser]){
        
        LoginViewController *login = [[LoginViewController alloc]init];
        
        
        [login setDelegate:self];
        [login setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
        [login setFields: PFLogInFieldsUsernameAndPassword|
         PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton | PFLogInFieldsPasswordForgotten | PFLogInFieldsTwitter | PFLogInFieldsFacebook ] ;
        
        SignUpViewController *signupViewController = [[SignUpViewController alloc]init];
        [signupViewController setDelegate:self];
        
        [login setSignUpController:signupViewController];
        
        [self presentViewController:login animated:YES completion:NULL];
    

    }
}
-(BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password{
    
    if (username && password && username.length !=0 && password.length !=0) {
        return YES;
    }
    
    [[[UIAlertView alloc]initWithTitle:@"Falta información"
                               message:@"Porfavor completa todos los campos"
                              delegate:nil
                     cancelButtonTitle:@"ok"
                     otherButtonTitles:nil] show];
    
    return NO;
}

// el login ha funcionado solo tenemos que comprobar el origen: Si es Twitter, Facebook o es el sistema interno
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user{
    
    NSLog(@"Usuario Logado");

    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error{
    
    NSLog(@"Se ha producido un error: %@", error.description);
    
}

-(void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController{ [self.navigationController popViewControllerAnimated:YES];
    
    
}


@end
