//
//  AnimationTest.m
//  HDFrameCoreShow
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AnimationTest.h"
#import "HDDefault.h"
@implementation AnimationTest
{
    UIButton * view;
    
}
-(instancetype)init{
    
    if (self = [super init]) {
        view = [[UIButton alloc] init];
        view.x = 100;
        view.y = 100;
        view.width = 50;
        view.height = 50;
        view.backgroundColor = [UIColor redColor];
//        [view addTarget:self action:@selector(buttonClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return self;
    
    
}

-(void)test{
    
    
    
    [self.vc.view addSubview:view];
    
     [view addTarget:self action:@selector(buttonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}
-(void)test1{
    [self.vc.view addSubview:view];
     [view addTarget:self action:@selector(CAReplicatorLayer) forControlEvents:(UIControlEventTouchUpInside)];
    
}
-(void) buttonClick{
    
    [UIView animateWithDuration:2 animations:^{
        
        view.width = 100;
        
    }];
    view.alpha = 0.5;
}
/*
 * CABasicAnimation
 *   对应UIView动画
 [UIView animateWithDuration:(NSTimeInterval)  //动画持续时间
 animations:^{
 //执行的动画
 }];
 *
 */
-(void) buttonClick1{
    CABasicAnimation * basicAm = [CABasicAnimation animation];
    basicAm.keyPath = @"position.x";
    
    basicAm.toValue = [NSNumber numberWithFloat:200];
    
    basicAm.duration = 2;
//    basicAm.fillMode = kCAFillModeForwards;
//    basicAm.removedOnCompletion = NO;
    [view.layer addAnimation:basicAm forKey:@"fas"];
}
/*
 * CAKeyframeAnimation   values
 对应UIView的这个
 [UIView animateKeyframesWithDuration:(NSTimeInterval)//动画持续时间
 delay:(NSTimeInterval)//动画延迟执行的时间
 options:(UIViewKeyframeAnimationOptions)//动画的过渡效果
 animations:^{
 //执行的关键帧动画
 }
 completion:^(BOOL finished) {
 //动画执行完毕后的操作
 }];
 
 */
-(void) buttonCLick2{
    CAKeyframeAnimation * keyAm = [CAKeyframeAnimation animation];
    keyAm.keyPath = @"position";
    //basicAm.duration = 2;
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(250, 200)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(250, 300)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(150, 300)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(150, 200)];
   
    keyAm.values = @[value1,value2,value3,value4,value5];
    
    [view.layer addAnimation:keyAm forKey:nil];
    
}
/*
 * CAKeyframeAnimation   path
 */
-(void) buttonCLick3{
    CAKeyframeAnimation * keyAm = [CAKeyframeAnimation animation];
    keyAm.keyPath = @"position";
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    keyAm.path = [path CGPath];
    
    keyAm.duration = 4;
    
    [view.layer addAnimation:keyAm forKey:nil];
    
}
/*
 *  CATransition
 对应UIView动画的
 [UIView transitionFromView:(nonnull UIView *)
 toView:(nonnull UIView *)
 duration:(NSTimeInterval)
 options:(UIViewAnimationOptions)
 completion:^(BOOL finished) {
 //动画执行完毕后的操作
 }];
 //单个视图的过渡动画
 [UIView transitionWithView:(nonnull UIView *)
 duration:(NSTimeInterval)
 options:(UIViewAnimationOptions)
 animations:^{
 //执行的动画
 }
 completion:^(BOOL finished) {
 //动画执行完毕后的操作
 }];
 */
-(void) buttonCLick4{
    CATransition * ani = [CATransition animation];
    ani.type = @"pageCurl";
    ani.subtype = kCATransitionFromRight;
    ani.duration = 1;
    
//    [view setImage:[UIImage imageNamed:@"8"] forState:(UIControlStateNormal)];
//    view.imageView.image = ;
    if (view.backgroundColor == [UIColor redColor]) {
        view.backgroundColor = [UIColor blueColor];
    }else{
         view.backgroundColor = [UIColor redColor];
    }
//    ani.delegate = self;
    
    [view.layer addAnimation:ani forKey:nil];
    
}
/*
 *CASpringAnimation  弹簧效果
 对应UIView动画的，这个可以在iOS7+中使用
 [UIView animateWithDuration:(NSTimeInterval)//动画持续时间
 delay:(NSTimeInterval)//动画延迟执行的时间
 usingSpringWithDamping:(CGFloat)//震动效果，范围0~1，数值越小震动效果越明显
 initialSpringVelocity:(CGFloat)//初始速度，数值越大初始速度越快
 options:(UIViewAnimationOptions)//动画的过渡效果
 animations:^{
 //执行的动画
 }
 completion:^(BOOL finished) {
 //动画执行完毕后的操作
 }];
 */
- (void)springAni {
    /*
     *  ios9 之后的
     */
    CASpringAnimation * ani = [CASpringAnimation animationWithKeyPath:@"position.x"];
    ani.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    ani.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    ani.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani.duration = ani.settlingDuration;
    ani.toValue = [NSNumber numberWithFloat:200];

//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:ani forKey:@"boundsAni"];
}
/*
 *  组动画
 */
-(void) groupAni{
    CASpringAnimation * ani1 = [CASpringAnimation animationWithKeyPath:@"bounds.size.width"];
    ani1.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    ani1.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani1.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    ani1.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani1.duration = 4;
    ani1.beginTime = 3;
    ani1.toValue = [NSNumber numberWithFloat:200];
    
    
    
    
    CAKeyframeAnimation * keyAm = [CAKeyframeAnimation animation];
    keyAm.keyPath = @"position";
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    keyAm.path = [path CGPath];
    
    keyAm.duration = 4;
    
    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[ani1,keyAm];
    
    groupAni.duration = 4;
    
    [view.layer addAnimation:groupAni forKey:nil];
    
}
/*
 *   帧动画。
 */
-(void) viewAnimationTest{
    
    
    
    [UIView animateKeyframesWithDuration:2.0 delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
                [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0/4 animations:^{
                    view.x = 130;
                    view.y = 130;
                }];
                [UIView addKeyframeWithRelativeStartTime:1.0/4 relativeDuration:1.0/4 animations:^{
                    view.x = 150;
                    view.y = 100;
                }];
                [UIView addKeyframeWithRelativeStartTime:2.0/4 relativeDuration:1.0/4 animations:^{

                    
                    view.x = 170;
                    view.y = 70;
                }];
                [UIView addKeyframeWithRelativeStartTime:3.0/4 relativeDuration:1.0/4 animations:^{
                    view.x = 200;
                    view.y = 100;
                }];

    }completion:^(BOOL finished){
        NSLog(@"动画结束");
    }];
}
/*
 *  UIVIew事务test
 */
-(void) transaction{
    [CATransaction begin];
    
    //显式事务默认开启动画效果,kCFBooleanTrue关闭
    [CATransaction setValue:(id)kCFBooleanFalse
                     forKey:kCATransactionDisableActions];
    //动画执行时间
    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
    //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
//    anotherLayer.cornerRadius = (anotherLayer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    view.layer.opacity = (view.layer.opacity == 1.0f) ? 0.5f : 1.0f;
    
    [CATransaction commit];

}
-(void) CAReplicatorLayer{
    CAReplicatorLayer *bar = [CAReplicatorLayer layer];
    
    bar.instanceCount = 30;
    bar.instanceDelay = 0.3;
    bar.instanceGreenOffset = -0.03;       // 颜色值递减。
    bar.instanceRedOffset = -0.02;         // 颜色值递减。
    bar.instanceBlueOffset = -0.01;

    bar.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    [self.vc.view.layer addSublayer:bar];
    
    CALayer * contentLayer = [CALayer layer];
    
    contentLayer.backgroundColor = [UIColor redColor].CGColor;
    
    contentLayer.bounds = CGRectMake(0, 0, 30, 100);
    
    contentLayer.position = CGPointMake(15, 200);
    
    contentLayer.anchorPoint = CGPointMake(0.5, 1);
    
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale.y";
    
    anim.toValue = @(0.1);
    
    anim.autoreverses = YES;
    
    anim.repeatCount = MAXFLOAT;
    

    
    [contentLayer addAnimation:anim forKey:nil];
    [bar addSublayer:contentLayer];
}
@end
