//
//  ViewController.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "ConstraintViewController.h"
#import "VFLViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor=[UIColor whiteColor];
    

    /**
     *  
        本页面用于对比不使用AutoLayout
        AutoLayoutDemo分为用NSLayoutConstraint创建一个约束，VFL创建一组约束以及使用Autolayout实现UITableView的Cell动态布局和高度动态改变
     
     */
   UIButton *butt=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:butt];
    butt.frame=CGRectMake((SCREEN_WIDTH-200)/2, 150, 200, 40);
    butt.titleLabel.font=[UIFont systemFontOfSize:13];
    butt.backgroundColor=[UIColor colorWithRed:0.09 green:0.42 blue:0.93 alpha:1];
    [butt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [butt setTitle:@"创建一个约束" forState:UIControlStateNormal];
    [butt addTarget:self action:@selector(buttAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *butt1=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:butt1];
    butt1.frame=CGRectMake((SCREEN_WIDTH-200)/2, 200, 200, 40);
    butt1.titleLabel.font=[UIFont systemFontOfSize:13];
    butt1.backgroundColor=[UIColor colorWithRed:0.09 green:0.42 blue:0.93 alpha:1];
    [butt1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [butt1 setTitle:@"VFL创建一组约束" forState:UIControlStateNormal];
    [butt1 addTarget:self action:@selector(butt1Action) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *butt2=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:butt2];
    butt2.frame=CGRectMake((SCREEN_WIDTH-200)/2, 250, 200, 40);
    butt2.titleLabel.font=[UIFont systemFontOfSize:13];
    butt2.backgroundColor=[UIColor colorWithRed:0.09 green:0.42 blue:0.93 alpha:1];
    [butt2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [butt2 setTitle:@"Cell高度动态改变" forState:UIControlStateNormal];
    [butt2 addTarget:self action:@selector(butt2Action) forControlEvents:UIControlEventTouchUpInside];
    

}

-(void)buttAction{
   
    ConstraintViewController *constraintVC=[[ConstraintViewController alloc] init];
    [self.navigationController pushViewController:constraintVC animated:YES];
    
}
-(void)butt1Action{
    VFLViewController *viewController=[[VFLViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
}
-(void)butt2Action{
    TableViewController *tableVC=[[TableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
