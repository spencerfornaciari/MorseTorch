//
//  TorchController.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/21/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "TorchController.h"

#define BASE_SLEEP 400000

@implementation TorchController

- (id)init
{
    if (self = [super init])
    {
        _flashQueue = [NSOperationQueue new];
        _flashQueue.maxConcurrentOperationCount = 1;
    }
    
    return self;
}

#pragma mark - Morse Code Signals
- (void)shortFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnTorch:device];
        usleep(BASE_SLEEP);
        [self turnOffTorch:device];
        usleep(BASE_SLEEP *2);
    }
}

- (void)longFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [self turnOnTorch:device];
        usleep(BASE_SLEEP * 3);
        [self turnOffTorch:device];
        usleep(BASE_SLEEP * 2);
    }
}

- (void)pauseBetweenWords
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        usleep(BASE_SLEEP * 5);
    }
}

#pragma mark - Flash On/Off Methods
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

#pragma mark - Parse morse code flash from symbol
- (void)flashForSymbol:(NSString *)string isLast:(BOOL)isLast
{
  [_flashQueue addOperationWithBlock:^{
      [self.delegate currentPosition:string];
    
      for (int i = 0; i < string.length; i++)
      {
          NSString *symbolElement = [string substringWithRange:NSMakeRange(i, 1)];
          
          if ([symbolElement isEqualToString:@"."]) {
              NSLog(@"It is a dot");
              [self shortFlash];
          } else if ([symbolElement isEqualToString:@"-"])
          {
              NSLog(@"It is a dash");
              [self longFlash];
          } else
          {
              NSLog(@"It is a space");
              [self pauseBetweenWords];
          }
          
          if (i == (string.length - 1) && isLast) {
              [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                  [self.delegate lastSymbol];
              }];
          }
      }
  }];
   
}

@end