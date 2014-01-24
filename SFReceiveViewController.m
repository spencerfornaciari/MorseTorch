//
//  SFReceiveViewController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFReceiveViewController.h"
#import "NSString+MorseCode.h"

@interface SFReceiveViewController ()
{
    NSDate *date1, *date2;
    NSString *string;
}

@end

@implementation SFReceiveViewController

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
    string = @"";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    date1 = [NSDate date];
    date2 = [NSDate date];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)receiveOnMagicEventDetected:(NSNotification *) notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        date1 = [NSDate date];
        NSTimeInterval distanceBetweenDates = [date1 timeIntervalSinceDate:date2];
        
        if (distanceBetweenDates < .1) {
            NSLog(@"%@", string);
            self.receivedMessage.text = @"DOT";
            string = [string stringByAppendingString:@"."];
//        } else if (distanceBetweenDates > .2 && [distanceBetweenDates < .3)
        } else if (distanceBetweenDates > .3){
            string = [string stringByAppendingString:@"-"];

                NSLog(@"%@", string);
            self.receivedMessage.text = @"DASH";
        }
        
        //NSLog(@"%f", distanceBetweenDates);
        
        
        
        //YOUR CODE HERE
    });
}

-(void)receiveOnMagicEventNotDetected:(NSNotification *) notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        date2 = [NSDate date];
        NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
        if (distanceBetweenDates > .5) {
            string = [string stringByAppendingString:@" "];
            NSLog(@"%@", string);
            self.receivedMessage.text = @"PAUSE";

        } else {
            
        }
        //NSLog(@"%f", distanceBetweenDates);
       // NSLog(@"DASH DASH DASH");

    });
}

@end
