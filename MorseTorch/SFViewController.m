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
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;

- (IBAction)cancelMessage:(id)sender;

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
    _cancelButton.backgroundColor = [UIColor blueColor];
    _cancelButton.tintColor = [UIColor whiteColor];
    
    _morseButton.enabled = NO;
    _cancelButton.enabled = NO;
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

- (IBAction)cancelMessage:(id)sender {
    [self cancelTorch];
}

- (IBAction)submitMessage:(id)sender
{
    //[self.morseButton setTitle:@"Cancel" forState:UIControlStateNormal];
    _cancelButton.enabled = YES;
    _morseButton.enabled = NO;
    self.controller.isLastSymbol = NO;
    _message = _morseCodeMessage.text;
    
    NSArray *tempArray = _message ? [_message symbolsForString] : @[@"String Was Nil"];
    
   for (NSString *string in tempArray) {
       if ([tempArray lastObject] == string)
       {
           //self.controller.isLastSymbol = YES;
           //_morseButton.enabled = YES;
           
           NSLog(@"The last symbol is: %@", string);
       }
       
       [self.controller flashForSymbol:string];
    }
    
//    if (self.controller.isLastSymbol) {
//        [self.morseButton setTitle:@"Submit" forState:UIControlStateNormal];
//    }
    
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

- (void)cancelTorch
{
    _morseButton.enabled = YES;
    _cancelButton.enabled = NO;
    [self.controller.flashQueue cancelAllOperations];
}




@end
