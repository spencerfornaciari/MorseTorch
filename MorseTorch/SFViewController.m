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

	// Do any additional setup after loading the view, typically from a nib.
    _morseCodeMessage.delegate = self;
    _morseButton.backgroundColor = [UIColor redColor];
    _morseButton.tintColor = [UIColor whiteColor];
    _cancelButton.backgroundColor = [UIColor blueColor];
    _cancelButton.tintColor = [UIColor whiteColor];
    
    _morseButton.enabled = NO;
    _morseButton.alpha = 1;
    _cancelButton.enabled = NO;
    _cancelButton.alpha = 0;
    self.controller = [TorchController new];
    self.controller.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button actions

- (IBAction)cancelMessage:(id)sender {
    [self cancelTorch];
}

- (IBAction)submitMessage:(id)sender
{
    _cancelButton.enabled = YES;
    
    [UIView animateWithDuration:.5 animations:^{
        _morseButton.alpha = 0;
        _cancelButton.alpha = 1;
    }];
    self.controller.isLastSymbol = NO;
    _message = _morseCodeMessage.text;
    
    NSArray *tempArray = _message ? [_message symbolsForString] : @[@"String Was Nil"];
    int i = 0;
   for (NSString *string in tempArray) {
       if (i == (tempArray.count - 1))
       {
           [self.controller flashForSymbol:string isLast:TRUE];
       } else {
           [self.controller flashForSymbol:string isLast:FALSE];
       }
       
       i++;
    }
    
    [sender resignFirstResponder];
}

#pragma mark - UITextField Delegate Methods

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

#pragma mark - TorchController Delegate Methods

- (void)currentPosition:(NSString *)string
{
    NSLog(@"Delegate Receiving: %@", string);
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        NSString *letter = [NSString letterForSymbol:string];
        [ProgressHUD show:letter];
    }];
}

- (void)cancelTorch
{
    [UIView animateWithDuration:1 animations:^{
        _morseButton.alpha = 1;
        _cancelButton.alpha = 0;
    }];
    [self.controller.flashQueue cancelAllOperations];
    [ProgressHUD dismiss];

}

- (void)lastSymbol
{
    [ProgressHUD dismiss];
    [UIView animateWithDuration:.5 animations:^{
        _morseButton.alpha = 1;
        _cancelButton.alpha = 0;
    }];
}


@end
