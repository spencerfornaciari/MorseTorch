//
//  TorchController.h
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/21/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AVFoundation;

@protocol TorchControllerDelegate <NSObject>
@required
- (void)currentPosition;

@end

@interface TorchController : NSObject

@property (nonatomic, weak) id<TorchControllerDelegate> delegate;
- (void)flashForSymbol:(NSString *)letter;

@end