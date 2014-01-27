//
//  SFReceiveViewController.h
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/24/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFMagicEvents.h"

@interface SFReceiveViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *receivedMessage;
@property (nonatomic) NSTimeInterval  distanceBetweenDates, distanceBetweenDates2;
@property (nonatomic) NSDate *date1, *date2;
@property (nonatomic) NSInteger countOn, countOff;
@property (nonatomic) CFMagicEvents *magicEvent;


@end
