//
//  StringViewController.m
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "StringViewController.h"
#import "NSString+More.h"

@interface StringViewController ()

@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self rangeOfStringsTest];
    
}

-(void) rangeOfStringTest{
    NSString * str = @"alsfdalj我们他们asdfadfa";
    
    NSString * searchString = @"a*";
    
    NSRange range = [str rangeOfString:searchString options:NSRegularExpressionSearch];
    
    if (range.location != NSNotFound) {
        NSLog(@"%@",[str substringWithRange:range]);
    }
    
    
    
}

-(void) rangeOfStringsTest{
    NSString *searchText = @"<script type=\"text/javascript\" src=\"js/ALLDefault.js\" ></script>#move{width: 60px;height: 40px;background-color: yellow;position: absolute;top: 0z-index: 1000;}#pop{width: 60px;height: 40px;background-color: yellow;position: absolute;left: 80px;top: 0;z-index: 1000;}<script type=\"text/javascript\" src=\"main.js\" ></script>";
    
//    NSString * searchTest2 = @"aaabaabaaaabaaabaaabaabagerwergwgsdkfpajfa;k;sj;jf;aj";
    

    
    NSArray<NSTextCheckingResult *> * results = [searchText arrayNotOverlapWithRegex:@"<script(\\s+)[^>]*\\s+src=\\s*\"[^>]+\\.js\"[^>]*/?>" withSubRegexRange:NSMakeRange(27, 11)];
    

    
    for (NSInteger index = 0; index < results.count; index += 1) {
        
        NSLog(@"%ld %ld %@",results[index].range.location,results[index].range.location + results[index].range.length - 1,[searchText substringWithRange:results[index].range]);
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
