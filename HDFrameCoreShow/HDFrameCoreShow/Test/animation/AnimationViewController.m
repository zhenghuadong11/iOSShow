//
//  AnimationViewController.m
//  HDFrameCoreShow
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AnimationViewController.h"
#import "AnimationTest.h"
@interface AnimationViewController ()

@end

@implementation AnimationViewController
{
    AnimationTest * test;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    test = [[AnimationTest alloc] init];
    test.vc = self;
    [test test1];
    
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
