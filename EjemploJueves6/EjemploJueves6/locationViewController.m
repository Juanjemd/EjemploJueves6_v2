//
//  locationViewController.m
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import "locationViewController.h"
#import "Localizacion.h"
#import <Parse/Parse.h>

@interface locationViewController ()

@end

@implementation locationViewController


-(id)initWithCoordenates:(CLLocationCoordinate2D)coord {
   
    if (self = [super initWithNibName:nil bundle:nil]) {
        
        self.coordenadas = coord;
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.latitudTextField.text =  [NSString stringWithFormat:@"%f", self.coordenadas.latitude];
    self.longitudTextField.text = [NSString stringWithFormat:@"%f", self.coordenadas.longitude];;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveInParse:(id)sender {
    
    
    //PFObject *loc = [PFObject objectWithClassName:@"localizacion"];
    
    Localizacion *loc = [[Localizacion alloc] init];
    //[loc setObject:self.etiquetaTextField.text forKey:@"etiqueta"];
    loc.etiqueta = self.etiquetaTextField.text;
    [loc setObject:[PFGeoPoint geoPointWithLatitude:self.coordenadas.latitude longitude:self.coordenadas.longitude] forKey:@"posicion"];
    
    [loc saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Guardado");

        } else {
            NSLog(@"Error al guardar las coordenadas");
            
        }
    }];
    
}
@end
