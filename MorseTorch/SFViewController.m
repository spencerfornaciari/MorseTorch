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

@property (weak, nonatomic) IBOutlet UILabel *morseCodeLabel;
@property (strong, nonatomic) IBOutlet UITextField *morseCodeMessage;
@property (strong, nonatomic) IBOutlet UIButton *morseButton;
@property (nonatomic) TorchController *controller;

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
    self.controller = [TorchController new];
    self.controller.delegate = self;
    
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
    _message = _morseCodeMessage.text;
    
    NSArray *tempArray = _message ? [_message symbolsForString] : @[@"String Was Nil"];
    
   // [self.morseButton setTitle:@"Cancel" forState:UIControlStateNormal];

   for (NSString *string in tempArray) {
       if ([tempArray lastObject] == string)
       {
           self.controller.isLastSymbol = YES;
       }
        [self.controller flashForSymbol:string];
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

- (void)currentPosition:(NSString *)string
{
    NSLog(@"Delegate Receiving: %@", string);
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSString *letter = [NSString letterForSymbol:string];
        self.morseCodeLabel.text = letter;
    }];
}


@end
