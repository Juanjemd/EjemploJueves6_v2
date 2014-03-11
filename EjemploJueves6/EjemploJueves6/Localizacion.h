//
//  Localizacion.h
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 07/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import <Parse/Parse.h>

@interface Localizacion : PFObject <PFSubclassing>

+(NSString *)parseClassName;

@property (nonatomic) CLLocationCoordinate2D coordenadas;
@property (nonatomic, copy) NSString *etiqueta;

@end
