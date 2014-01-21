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

@property (strong, nonatomic) IBOutlet UILabel *morseCodeLabel;
@property (strong, nonatomic) IBOutlet UITextField *morseCodeMessage;
@property (strong, nonatomic) IBOutlet UIButton *morseButton;

- (IBAction)submitMessage:(id)sender;

@property (nonatomic) NSString *message;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.morseCodeLabel.text = @"NEW";
	// Do any additional setup after loading the view, typically from a nib.
    _morseCodeMessage.delegate = self;
    _morseButton.backgroundColor = [UIColor redColor];
    _morseButton.tintColor = [UIColor whiteColor];
    _morseButton.enabled = NO;
    
//    if (!_morseCodeMessage.text) {
//        _morseButton.enabled = NO;
//    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitMessage:(id)sender
{
    //Grab text from UITextField and convert to morse code

//    } else {
//        _morseButton.enabled = YES;
//    }
    
    _message = _morseCodeMessage.text;
    
    NSArray *tempArray = _message ? [_message symbolsForString] : @[@"String Was Nil"];
    NSString *newString = tempArray[0];
    NSLog(@"%@", newString);
    
    [self.morseButton setTitle:@"Cancel" forState:UIControlStateNormal];

    
    for (NSString *string in tempArray) {
        TorchController *controller = [TorchController new];
        [controller flashForSymbol:string];
        self.morseCodeLabel.text = string;
        //;
    }
    
    [sender resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _morseButton.enabled = NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length > 0) {
        _morseButton.enabled = YES;
    } else {
        _morseButton.enabled = NO;
    }
}

- (void)currentPosition
{
    
}


@end
