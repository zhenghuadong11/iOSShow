//
//  NSString+Handle.h
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Handle)

/*
 * 字符串转化为chars
 * 每个char是一个utf8字符
 * char的长度== string+1；
 */
-(void) toUTF8_Chars:(unichar *) chars;
/*
 *  char To string ，失败了，放着做个纪念吧
 */
+(NSString *) stringWithUTF8Chars:(const unichar *)chars;
+(NSString *)stringWithUTF8Chars:(const unichar *)charArr index:(NSInteger) index;

/*
 *
 */

@end
