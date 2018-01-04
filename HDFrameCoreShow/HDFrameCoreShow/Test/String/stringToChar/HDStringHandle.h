//
//  HDStringHandle.h
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *  字符串转化为char的处理封装
 *  失败了，用时是使用原声NSMutableString的两到三倍；是直接替换的5倍
 *  继续优化可以是使用数字进行比较，先算了，因为这个不是很重要的
 *  选第二第三种吧，方便点。不浪费时间了
 */
@interface HDStringHandle : NSObject

-(void) setString:(NSString *) string;

-(NSString * ) getString;

-(NSString *) stringWithIndex:(NSInteger) index;
/*
 *  设置长度后会自动清零
 */
-(void) setLength:(NSInteger) length;
/*
 * 只会设置开头的那个字符
 */
-(BOOL) setChar:(NSString *) oneChar index:(NSInteger)index;

/*
 *
 */
-(void) addString:(NSString *) string;
@end
