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
- (void)currentPosition:(NSString *)string;
- (void)lastSymbol;
- (void)cancelTorch;

@end

@interface TorchController : NSObject

@property (unsafe_unretained) id<TorchControllerDelegate> delegate;
@property (nonatomic) NSOperationQueue *flashQueue;
@property (nonatomic) BOOL isLastSymbol;

- (void)flashForSymbol:(NSString *)string isLast:(BOOL)isLast;
@end
