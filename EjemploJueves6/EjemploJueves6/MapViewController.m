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
@end
