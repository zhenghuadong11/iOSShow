//
//  AnimationTool.h
//  HDFrameCoreShow
//
//  Created by apple on 2018/1/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AnimationTool : NSObject
/*
 http://www.cocoachina.com/ios/20160517/16290.html
 UIView动画：http://www.cocoachina.com/ios/20160512/16228.html
 CAAnimation属性：timingFunction
 Name的enum值如下：
 kCAMediaTimingFunctionLinear 匀速
 kCAMediaTimingFunctionEaseIn 慢进
 kCAMediaTimingFunctionEaseOut 慢出
 kCAMediaTimingFunctionEaseInEaseOut 慢进慢出
 kCAMediaTimingFunctionDefault 默认值（慢进慢出）
 
 fillMode：视图在非Active时的行为
 　　removedOnCompletion：动画执行完毕后是否从图层上移除，默认为YES（视图会恢复到动画前的状态），可设置为NO（图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards）
 就算视图固定不返回，也没有改变原来的位置。只是看起来变了
 
 UIColor colorWithPatternImage:<#(nonnull UIImage *)#>
 图片是可以变成颜色的  // 这样没有拉伸，可以进行平铺
 
 self.view.layer.contents = (id)[UIImage imageNamed:@"1.png"].CGImage;
 
 ani.delegate = self; 结束的时候改变view的值，实现视图和实质视图一直挺不错的
 
 aniChangePath1.autoreverses = YES;     //会反转
 aniChangePath1.repeatCount = NSIntegerMax;  //重复次数
 
 CAReplicatorLayer
 */
-(void) animation:(UIView *) view;



#pragma mark --支持keyPath的属性
/*
 //CATransform3D Key Paths : (example)transform.rotation.z
 //rotation.x
 //rotation.y
 //rotation.z
 //rotation 旋轉
 //scale.x
 //scale.y
 //scale.z
 //scale 缩放
 //translation.x
 //translation.y
 //translation.z
 //translation 平移
 
 //CGPoint Key Paths : (example)position.x
 //x
 //y
 
 //CGRect Key Paths : (example)bounds.size.width
 //origin.x
 //origin.y
 //origin
 //size.width
 //size.height
 //size
 
 //opacity
 //backgroundColor
 //cornerRadius
 //borderWidth
 //contents
 
 //Shadow Key Path:
 //shadowColor
 //shadowOffset
 //shadowOpacity
 //shadowRadius
 */
@end
