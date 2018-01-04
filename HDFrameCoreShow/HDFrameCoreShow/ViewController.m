//
//  ViewController.m
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
//#import "NSString+Handle.h"
#import "HDStringHandle.h"
#import "NSString+Handle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
    NSLog(@"tiana");
    NSString * str1 = @"我们aaa我们aa";
    NSMutableString * str = [NSMutableString string];
    
    for (NSInteger index = 0; index < 1000; index += 1) {
        [str appendString:str1];
    }
    
    NSDate * date1 = [NSDate date];
    [self newHandle:str];
  
//    [str inser]

    NSDate * date2 = [NSDate date];
    NSLog(@"%f",[date2 timeIntervalSinceDate:date1]);
    
    NSDate * date3 = [NSDate date];
    
      [self handle:str];
   
    
    NSDate * date4 = [NSDate date];
    NSLog(@"%f",[date4 timeIntervalSinceDate:date3]);

    NSDate * date5 = [NSDate date];
    
    NSString * a = [str stringByReplacingOccurrencesOfString:@"我" withString:@"他"];
//    NSString * b = [a stringByReplacingOccurrencesOfString:@"a" withString:@"b"];
    
    NSDate * date6 = [NSDate date];
    NSLog(@"%f",[date6 timeIntervalSinceDate:date5]);
   
    
    
    
    
}

-(void) newHandle:(NSString *) str{
    for (NSInteger index = 0; index < 1;index += 1) {
        HDStringHandle * strHandle1 = [[HDStringHandle alloc] init];
        [strHandle1 setString:str];
        
        
        
        HDStringHandle * strHandle12 = [[HDStringHandle alloc] init];
        
        for(NSInteger index = 0;true ; index+=1){
            if ([strHandle1 stringWithIndex:index] == nil) {
                break;
            }
            
            if ([[strHandle1 stringWithIndex:index] isEqualToString:@"我"]) {
                [strHandle12 addString:@"他"];
            }else{
                [strHandle12 addString:[strHandle1 stringWithIndex:index]];
            }
            
            
            
            
            
            
        }
        
    }
}
-(void) handle:(NSString *) str{
     for (NSInteger index = 0; index < 1;index += 1) {
    NSMutableString * mStr = [NSMutableString string];
    
    
    for (NSInteger index = 0; index < str.length; index += 1) {
        NSString * a = [str substringWithRange:NSMakeRange(index, 1)];
        if ([a isEqualToString:@"我"]) {
            [mStr appendString:@"你"];
            
        }else{
            [mStr appendString:a];
        }
        
    }
  
    
      }
}
-(void) handle1:(NSString *) str{
    for (NSInteger index = 0; index < str.length; index += 1) {
        NSString * a = [str substringWithRange:NSMakeRange(index, 1)];
    }
}
-(void) handle2:(NSString *) str{
    unichar chars[str.length + 1];
    [str toUTF8_Chars:chars];
    for (NSInteger index = 0; chars[index]; index += 1) {
        unichar a = chars[index];
    }
    [NSString stringWithUTF8Chars:chars];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
