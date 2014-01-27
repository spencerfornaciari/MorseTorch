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
    BOOL isLetter;
    NSString *string, *word;
    NSMutableArray *letterArray;
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
    self.receivedMessage.text = @"";
    _magicEvent = [CFMagicEvents new];
    self.date1 = [NSDate date];
    self.date2 = [NSDate date];
    self.countOn = 0;
    self.countOff = 0;
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
        //NSLog(@"Off: %li", (long)self.countOff);
        
        if (self.countOn > 18) {
            NSLog(@"-");
        } else if (self.countOn >= 6) {
            NSLog(@".");
        }
        //        self.date1 = [NSDate date];
        //        self.distanceBetweenDates = [self.date1 timeIntervalSinceDate:self.date2];
        //
        //        if (self.distanceBetweenDates > .4) {
        //            NSLog(@"-");
        //        } else if (self.distanceBetweenDates > 0) {
        //            NSLog(@".");
        //        }
        
        self.countOn = 0;
        self.countOff++;
        
        
//        self.date2 = [NSDate date];
//        self.distanceBetweenDates = [self.date2 timeIntervalSinceDate:self.date1];
//        
//        
//        if (self.distanceBetweenDates < .4) {
//            
//            
//            
//        } else {
//            // string = [string stringByAppendingString:@" "];
//            // [letterArray addObject:@" "];
//            
//            // self.receivedMessage.text = [NSString letterForSymbol:string];
//            
//            //NSLog(@"%f", self.distanceBetweenDates);
//            
//            self.receivedMessage.text = @"PAUSE";
//        }
//        //NSLog(@"%f", self.distanceBetweenDates);
//        //NSLog(@"DASH");
//        
//        
//        self.date1 = [NSDate date];
        

            
//        if ([self.magicEvent returnBrightness] > 30000) {
//        }
        
         //YOUR CODE HERE
    });
}

-(void)receiveOnMagicEventNotDetected:(NSNotification *) notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        //NSLog(@"On: %li", (long)self.countOn);
        
        if (self.countOff > 30) {
            NSLog(@"PAUSE");
        }
        
        self.countOff = 0;
        self.countOn++;

        
        //NSLog(@"EVENT NOT DETECTED");
      // NSLog(@"%d", [self.magicEvent returnBrightness]);
    });
}

@end
