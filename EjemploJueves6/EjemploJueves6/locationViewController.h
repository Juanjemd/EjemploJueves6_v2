//
//  locationViewController.h
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface locationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *etiquetaTextField;

@property (weak, nonatomic) IBOutlet UITextField *longitudTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudTextField;
@property (nonatomic) CLLocationCoordinate2D coordenadas;

- (IBAction)saveInParse:(id)sender;

-(id) initWithCoordenates:(CLLocationCoordinate2D) coord;

@end
