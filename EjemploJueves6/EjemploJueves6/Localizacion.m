//
//  Localizacion.m
//  EjemploJueves6
//
//  Created by Juanje Mendoza Durán on 07/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//

#import "Localizacion.h"
#import <Parse/PFObject+Subclass.h>

@implementation Localizacion
@dynamic coordenadas, etiqueta;

+(NSString *)parseClassName {
    
    return @"localizacion"; //este es el nombre de la clase en Parse que estaba en minúsculas
    
}


@end
