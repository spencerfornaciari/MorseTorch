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
    
   // NSDictionary *symbolDictionary =
    
    return  [NSArray arrayWithArray:tempArray];
    
}

- (NSString *)symbolForLetter:(NSString *)letter
{
    
    letter = [letter uppercaseString];
    //return letter;
    
    
    //Translation from alphanumeric character to morse code
    NSDictionary *symbolDictionary = @{@"A": @". -",
                                       @"B": @"- . . .",
                                       @"C": @"- . - .",
                                       @"D": @"- . .",
                                       @"E": @".",
                                       @"F": @". . - .",
                                       @"G": @"- - .",
                                       @"H": @". . . .",
                                       @"I": @". .",
                                       @"J": @". - - -",
                                       @"K": @"- . -",
                                       @"L": @". - . .",
                                       @"M": @"- -",
                                       @"N": @"- .",
                                       @"O": @"- - -",
                                       @"P": @". - - .",
                                       @"Q": @"- - . -",
                                       @"R": @". - .",
                                       @"S": @". . .",
                                       @"T": @"-",
                                       @"U": @". . -",
                                       @"V": @". . . -",
                                       @"W": @". - -",
                                       @"X": @"- . . -",
                                       @"Y": @"- . - -",
                                       @"Z": @"- - . .",
                                       @"0": @"- - - - -",
                                       @"1": @". - - - -",
                                       @"2": @". . - - -",
                                       @"3": @". . . - -",
                                       @"4": @". . . . -",
                                       @"5": @". . . . .",
                                       @"6": @"- . . . .",
                                       @"7": @"- - . . .",
                                       @"8": @"- - - . .",
                                       @"9": @"- - - - ."};
    
    NSArray *dictArray = [symbolDictionary allKeys];
    
    for (int i = 0; i < dictArray.count; i++) {
        if ([dictArray[i] isEqualToString:letter]) {
            return [symbolDictionary valueForKey:dictArray[i]];
        }
    }
    
    return @"None";
}

@end
