//
//  VFLViewController.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//
/**
 *  

 参考链接：
  使用Auto Layout中的VFL(Visual format language)——代码实现自动布局
 http://www.cnblogs.com/wupei/p/4150626.html
 
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */
#import "VFLViewController.h"

@interface VFLViewController ()

@end

@implementation VFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (isIOS7GE) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:button];
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[button(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    
    UIButton *button1=[[UIButton alloc]init];
    button1.translatesAutoresizingMaskIntoConstraints=NO;
    [button1 setTitle:@"请不要点击我" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor colorWithRed:0.83 green:0.26 blue:0.2 alpha:1]];
    [self.view addSubview:button1];
    
    NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[button1]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button1)];
    
    NSArray *constraints4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-[button1(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button1,button)];
    
    [self.view addConstraints:constraints3];
    [self.view addConstraints:constraints4];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//下面的说明参考链接：https://github.com/jaywhj/AutoLayout
#pragma mark - 创建一组约束
/*
 使用VFL创建一组约束，参数说明:
 第一个参数：使用VFL格式化的字符串，具体语法参考下面的官方链接
 第二个参数：指定VFL中所有对象的布局属性和方向。比如2个视图使用V布局，可以使用 NSLayoutFormatAlignAllLeft 让他们对齐
 第三个参数：度量、指标的字典，字典里面的key可以写在第一个参数中。编译器解析时，自动替换为metrics字典中的value
 第四个参数：指定约束的一个或多个视图
 
 NSArray *constrtArr = [NSLayoutConstraint
 constraintsWithVisualFormat:<#(NSString *)#>
 options:<#(NSLayoutFormatOptions)#>
 metrics:<#(NSDictionary *)#>
 views:<#(NSDictionary *)#>];
 */

//可视化格式化语言Visual Format Language
//https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH3-SW1
/*
 语法总结：
 1、"H" 表示水平方向，"V" 表示垂直方向
 2、"|" 表示superview的边界
 3、"[]" 表示view，"()"表示尺寸数，可以多个条件组合，中间使用逗号分隔，如 view(>=70,<=100)
 4、"＠" 表示优先级。如V:|-50@750-[view(55)]，或者写到metrics里面更好
 */

@end
