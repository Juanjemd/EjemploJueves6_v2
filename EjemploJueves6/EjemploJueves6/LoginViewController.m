//
//  LoginViewController.m
//  EjemploJueves6
//
//  Created by Juan Antonio Martin Noguera on 06/03/14.
//  Copyright (c) 2014 Juanje Mendoza Durán. All rights reserved.
//
#import <Parse/Parse.h>
#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.logInView.signUpButton setTitle:@"Registro" forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitle:@"Registro" forState:UIControlStateHighlighted];
    
    [self.logInView.usernameField setTextColor:[UIColor whiteColor]];
    [self.logInView.passwordField setTextColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
