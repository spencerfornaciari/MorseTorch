//
//  SFViewController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@property (strong, nonatomic) IBOutlet UITextField *morseCodeMessage;

- (IBAction)submitMessage:(id)sender;

@property (nonatomic) NSString *message;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *tempString = [NSString stringWithFormat:@"goodbye"];
    
    NSArray *tempArray = tempString ? [tempString symbolsForString] : @[@"String Was Nil"];
    NSLog(@"%@", tempArray);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSLog(@"%@", textField);
//}




- (IBAction)submitMessage:(id)sender {
    
    _message = _morseCodeMessage.text;
   NSLog(@"%@", _message);
    
    [sender resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
