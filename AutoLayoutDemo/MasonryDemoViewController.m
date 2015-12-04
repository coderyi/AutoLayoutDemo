//
//  MasonryDemoViewController.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "MasonryDemoViewController.h"
#import "MasonryTableViewCell.h"
#import <Masonry/Masonry.h>
#import "MasonryDataEntity.h"
// 注释掉下面的宏定义，就是用“传统”的模板Cell计算高度
//#define IOS_8_NEW_FEATURE_SELF_SIZING
@interface MasonryDemoViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    
    
}
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MasonryDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    if (([[UIDevice currentDevice].systemVersion floatValue] >= 7.f)) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }
    
    // Do any additional setup after loading the view.
    _tableView=[[UITableView alloc] init];
    [self.view addSubview:_tableView];
    UIView *superview = self.view;
    
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.f) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding.top); //with is an optional semantic filler
        make.left.equalTo(superview.mas_left).with.offset(padding.left);
        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
        //        make.edges.equalTo(superview).with.insets(padding);
        
    }];
    _tableView.estimatedRowHeight = 80.0f;
    
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    // iOS 8 的Self-sizing特性
    if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
#endif
    
    // 注册Cell
    [_tableView registerClass:[MasonryTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MasonryTableViewCell class])];
    
    [self generateData];
    
    [_tableView reloadData];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    // iOS 8 的Self-sizing特性
    return UITableViewAutomaticDimension;
#else
    static MasonryTableViewCell *templateCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MasonryTableViewCell class])];
    });
    
    // 获取对应的数据
    MasonryDataEntity *dataEntity = _data[(NSUInteger) indexPath.row];
    
    // 填充数据
    [templateCell setupData:dataEntity];
    
    // 判断高度是否已经计算过
    if (dataEntity.cellHeight <= 0) {
        // 根据当前数据，计算Cell的高度，注意+1
        dataEntity.cellHeight = [templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
        NSLog(@"Calculate height: %ld", (long) indexPath.row);
    } else {
        NSLog(@"Get cache %ld", (long) indexPath.row);
    }
    
    return dataEntity.cellHeight;
#endif
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    Table1ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Table1ViewCell class]) forIndexPath:indexPath];
    
    NSString *CellId = @"autoCell";
    MasonryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[MasonryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
        cell.detailTextLabel.textColor=[UIColor grayColor];
        CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
        
        cell.backgroundColor=[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    }
    
    //
    //    Table1ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Table1ViewCell class]) forIndexPath:indexPath];
    [cell setupData:_data[(NSUInteger) indexPath.row]];
    return cell;
}

#pragma mark - Private methods

// 生成数据
- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        MasonryDataEntity *dataEntity = [MasonryDataEntity new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _data = tmpData;
}

// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
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
