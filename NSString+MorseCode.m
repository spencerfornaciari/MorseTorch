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
    
    NSString *noSpaces = self; //[self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //Grab morse code and check if the value is not alphanumeric
    for (int i = 0; i < noSpaces.length; i++)
    {
        NSString *string = [self symbolForLetter:[noSpaces substringWithRange:NSMakeRange(i, 1)]];
        
        if ([string isEqualToString:@""])
        {
            
        }
         else {
             [tempArray addObject:string];
        }
    }
        
    return  [NSArray arrayWithArray:tempArray];
}

- (NSString *)symbolForLetter:(NSString *)letter
{
    //Error checking
    letter = [letter uppercaseString];
    NSCharacterSet *alphaNumSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "];
    BOOL value = [alphaNumSet characterIsMember:[letter characterAtIndex:0]];
    
    if (!value) {
        return @"";
    }
    
    //Translation from alphanumeric character to morse code
    NSDictionary *symbolDictionary = @{@"A": @".",
                                       @"B": @"-...",
                                       @"C": @"-.-.",
                                       @"D": @"-..",
                                       @"E": @".",
                                       @"F": @"..-.",
                                       @"G": @"--.",
                                       @"H": @"....",
                                       @"I": @"..",
                                       @"J": @".---",
                                       @"K": @"-.-",
                                       @"L": @".-..",
                                       @"M": @"--",
                                       @"N": @"-.",
                                       @"O": @"---",
                                       @"P": @".--.",
                                       @"Q": @"--.-",
                                       @"R": @".-.",
                                       @"S": @"...",
                                       @"T": @"-",
                                       @"U": @"..-",
                                       @"V": @"...-",
                                       @"W": @".--",
                                       @"X": @"-..-",
                                       @"Y": @"-.--",
                                       @"Z": @"--..",
                                       @"0": @"-----",
                                       @"1": @".----",
                                       @"2": @"..---",
                                       @"3": @"...--",
                                       @"4": @"....-",
                                       @"5": @".....",
                                       @"6": @"-....",
                                       @"7": @"--...",
                                       @"8": @"---..",
                                       @"9": @"----.",
                                       @" ": @" "};
    
    NSArray *dictArray = [symbolDictionary allKeys];
    
    for (int i = 0; i < dictArray.count; i++) {
        
        if ([dictArray[i] isEqualToString:letter]) {
            return [symbolDictionary valueForKey:dictArray[i]];
        }
    }
    
    return @"None";
}

@end