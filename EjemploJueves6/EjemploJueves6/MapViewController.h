//
//  MapViewController.h
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LoginViewController.h"
#import "SignUpViewController.h"


@interface MapViewController : UIViewController <CLLocationManagerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate> {

        CLLocationManager *locationManager;
        float longitud;
        float latitud;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
