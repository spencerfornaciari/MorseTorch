//
//  SFOriginViewController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/26/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFOriginViewController.h"

@interface SFOriginViewController ()
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UIButton *receiveButton;

@end

@implementation SFOriginViewController

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
    self.sendButton.backgroundColor = [UIColor blueColor];
    self.sendButton.tintColor = [UIColor whiteColor];
    
    self.receiveButton.backgroundColor = [UIColor redColor];
    self.receiveButton.tintColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
