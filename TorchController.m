//
//  TorchController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/21/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "TorchController.h"

#define SLEEPTIME 300000;

@implementation TorchController

- (void)shortFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnTorch:device];
        usleep(400000);
        [self turnOffTorch:device];
        usleep(400000);
    }
}

- (void)longFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnTorch:device];
        //sleep(3);
        usleep(1200000);
        [self turnOffTorch:device];
        usleep(400000);
    }
}

- (void)pauseBetweenWords
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        usleep(2000000);
    }
}

- (void)turnOnTorch:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOn];
    [device setTorchModeOnWithLevel:.5 error:nil];
    [device setFlashMode:AVCaptureFlashModeOn];
   [device unlockForConfiguration];

}

- (void)turnOffTorch:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOff];
    [device setFlashMode:AVCaptureFlashModeOff];
    [device unlockForConfiguration];

}

- (void)flashForSymbol:(NSString *)letter
{
   // NSMutableArray *tempArray = [NSMutableArray new];
    
    //NSString *noSpaces = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //Grab morse code and check if the value is not alphanumeric
   NSOperationQueue *flashQueue = [NSOperationQueue new];
    flashQueue.maxConcurrentOperationCount = 1;
   //[flashQueue maxConcurrentOperationCount = 1]];
    
  [flashQueue addOperationWithBlock:^{
      for (int i = 0; i < letter.length; i++)
      {
          NSString *string = [letter substringWithRange:NSMakeRange(i, 1)];
          
          if ([string isEqualToString:@"."]) {
              NSLog(@"It is a dot");
              [self shortFlash];
          } else if ([string isEqualToString:@"-"])
          {
              NSLog(@"It is a dash");
              [self longFlash];
          } else
          {
              NSLog(@"It is a space");
              [self pauseBetweenWords];
          }
      }
  }];
   
}


@end