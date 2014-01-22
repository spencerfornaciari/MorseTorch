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


@end

@interface TorchController : NSObject

@property (nonatomic, unsafe_unretained) id<TorchControllerDelegate> delegate;
- (void)flashForSymbol:(NSString *)letter;
@property (nonatomic) BOOL isLastSymbol;

@end
