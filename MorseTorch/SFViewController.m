//
//  SFViewController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()
{
    BOOL lock;
    AVCaptureDevice *torch;
}

@property (strong, nonatomic) IBOutlet UITextField *morseCodeMessage;
@property (strong, nonatomic) IBOutlet UIButton *morseButton;

- (IBAction)submitMessage:(id)sender;

@property (nonatomic) NSString *message;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _morseCodeMessage.delegate = self;
    _morseButton.backgroundColor = [UIColor redColor];
    _morseButton.tintColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitMessage:(id)sender
{
    //Grab text from UITextField and convert to morse code
    _message = _morseCodeMessage.text;
    
    NSArray *tempArray = _message ? [_message symbolsForString] : @[@"String Was Nil"];
    NSString *newString = tempArray[0];
    NSLog(@"%@", newString);
    
    for (NSString *string in tempArray) {
        TorchController *controller = [TorchController new];
        [controller flashForSymbol:string];
    }
    
    [sender resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



@end
