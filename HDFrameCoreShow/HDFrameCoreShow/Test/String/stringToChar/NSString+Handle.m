//
//  NSString+Handle.m
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSString+Handle.h"

@implementation NSString (Handle)


-(void)toUTF8_Chars:(unichar *) chars{
    
    if (self != nil) {
        for (NSInteger index = 0; index < self.length; index += 1) {
            chars[index] = [self characterAtIndex:index];
        }
        chars[self.length] = 0;
    }
  
}


+(NSString *)stringWithUTF8Chars:(const unichar *)chars{
      return [self stringWithCharacters:chars length:[self lengthWithUnichar:chars]];
}
+(NSString *)stringWithUTF8Chars:(const unichar *)charArr index:(NSInteger) index{
    return [self stringWithCharacters:charArr+index length:1];
}






+(NSInteger) lengthWithUnichar:(const unichar *) chars{
    NSInteger length = 0;
    
    
    for (NSInteger index = 0; chars[index]; index += 1) {
        length += 1;
    }
    
    return length;
}





@end
