//
//  SFViewController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *tempString = [NSString stringWithFormat:@"hel lo"];
    
    NSArray *tempArray = tempString ? [tempString symbolsForString] : @[@"String Was Nil"];
    NSLog(@"%@", tempArray);
    
    //    if (tempString) {
    //        NSArray *tempArray = [tempString symbolsForString];
    //        NSLog(@"%@", tempArray);
    //    } else {
    //        //handle error
    //    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
