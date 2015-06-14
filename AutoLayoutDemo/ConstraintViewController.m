//
//  ConstraintViewController.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//
/**
 *  
 NSLayoutConstraint使用参考链接：
  http://www.mgenware.com/blog/?p=490
 
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */
#import "ConstraintViewController.h"

@interface ConstraintViewController (){
    UIButton *btn;
    
    
}

@end

@implementation ConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建UIButton，不需要设置frame
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"mgen" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithRed:0.09 green:0.63 blue:0.37 alpha:1];
    [self.view addSubview:btn];
    self.view.backgroundColor=[UIColor whiteColor];
    //禁止自动转换AutoresizingMask
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    //x居中
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:btn
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1
                              constant:0]];
    
    //距离底部20单位
    //注意NSLayoutConstraint创建的constant是加在toItem参数的，所以需要-20。
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:btn
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1
                              constant:-20]];
    
    //定义高度是父View的三分之一
    //设置优先级低于UILayoutPriorityRequired(1000)，UILayoutPriorityDefaultHigh是750
    NSLayoutConstraint *con = [NSLayoutConstraint
                               constraintWithItem:btn
                               attribute:NSLayoutAttributeHeight
                               relatedBy:NSLayoutRelationEqual
                               toItem:self.view
                               attribute:NSLayoutAttributeHeight
                               multiplier:0.3
                               constant:0];
    con.priority = UILayoutPriorityDefaultHigh;
    [self.view addConstraint:con];
    
    //设置btn最小高度为150
    [btn addConstraint:[NSLayoutConstraint
                        constraintWithItem:btn
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationGreaterThanOrEqual
                        toItem:nil
                        attribute:NSLayoutAttributeNotAnAttribute
                        multiplier:1
                        constant:150]];
    
    //注册KVO方法
    [btn addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionInitial context:nil];
}
//KVO回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == btn && [keyPath isEqualToString:@"bounds"])
    {
        [btn setTitle:NSStringFromCGSize(btn.bounds.size) forState:UIControlStateNormal];
      
    }
}
-(void)dealloc{


    [btn removeObserver:self forKeyPath:@"bounds"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

//下面关于NSLayoutConstraint说明的参考链接：http://rainbownight.blog.51cto.com/1336585/1316181
#pragma mark - 属性解释
/*
 typedef NS_ENUM(NSInteger, NSLayoutRelation) {
 NSLayoutRelationLessThanOrEqual = -1,          //小于等于
 NSLayoutRelationEqual = 0,                     //等于
 NSLayoutRelationGreaterThanOrEqual = 1,        //大于等于
 };
 typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
 NSLayoutAttributeLeft = 1,                     //左侧
 NSLayoutAttributeRight,                        //右侧
 NSLayoutAttributeTop,                          //上方
 NSLayoutAttributeBottom,                       //下方
 NSLayoutAttributeLeading,                      //首部
 NSLayoutAttributeTrailing,                     //尾部
 NSLayoutAttributeWidth,                        //宽度
 NSLayoutAttributeHeight,                       //高度
 NSLayoutAttributeCenterX,                      //X轴中心
 NSLayoutAttributeCenterY,                      //Y轴中心
 NSLayoutAttributeBaseline,                     //文本底标线
 
 NSLayoutAttributeNotAnAttribute = 0            //没有属性
 };
 
 //NSLayoutAttributeLeft/NSLayoutAttributeRight 和 NSLayoutAttributeLeading/NSLayoutAttributeTrailing的区别是：left/right永远是指左右，而leading/trailing在某些从右至左习惯的地区（希伯来语等）会变成，leading是右边，trailing是左边
 */


#pragma mark - 创建一个约束
/*
 创建一个约束，参数说明:
 第一个参数:指定约束左边的视图view1
 第二个参数:指定view1的属性attr1，具体见上面的 NSLayoutAttribute。
 第三个参数:指定左右两边的视图的关系relation，具体见上面的 NSLayoutRelation。
 第四个参数:指定约束右边的视图view2
 第五个参数:指定view2的属性attr2，具体见上面的 NSLayoutAttribute。
 第六个参数:指定一个与view2属性相乘的乘数multiplier
 第七个参数:指定一个与view2属性相加的浮点数constant
 
 NSLayoutConstraint *constraint = [NSLayoutConstraint
 constraintWithItem:<#(id)#>
 attribute:<#(NSLayoutAttribute)#>
 relatedBy:<#(NSLayoutRelation)#>
 toItem:<#(id)#>
 attribute:<#(NSLayoutAttribute)#>
 multiplier:<#(CGFloat)#>
 constant:<#(CGFloat)#>];
 
 //这个函数的对照公式为: view1.attr1 = view2.attr2 * multiplier + constant
 //如下面翻译过来就是：view1的左侧 等于 view2的右侧乘以1 再多10个点 的地方。
 [NSLayoutConstraint constraintWithItem:view1
 attribute:NSLayoutAttributeLeft
 relatedBy:NSLayoutRelationEqual
 toItem:view2
 attribute:NSLayoutAttributeRight
 multiplier:1
 constant:10];
 */

//如果你想设置的约束里不需要第二个view，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute


@end
