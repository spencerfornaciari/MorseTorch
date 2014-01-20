//
//  NSString+MorseCode.m
//  MorseTorch
//
//  Created by Spencer Fornaciari on 1/20/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "NSString+MorseCode.h"

@implementation NSString (MorseCode)

- (NSArray *)symbolsForString
{
    NSMutableArray *tempArray = [NSMutableArray new];
    
    NSString *noSpaces = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    for (int i = 0; i < noSpaces.length; i++)
    {
        [tempArray addObject:[self symbolForLetter:[noSpaces substringWithRange:NSMakeRange(i, 1)]]];
    }
    
    return  [NSArray arrayWithArray:tempArray];
    
}

- (NSString *)symbolForLetter:(NSString *)letter
{
    
    //    if ([letter rangeOfString:@" "].location == NSNotFound) {
    //        letter = [letter uppercaseString];
    //
    //        return letter;
    //
    //    } else {
    //        return @"No white space";
    //    }
    
    letter = [letter uppercaseString];
    return letter;
}

@end
