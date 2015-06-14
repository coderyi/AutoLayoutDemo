//
//  TableViewController.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//
/**
 *  
 参考链接：
 http://my.oschina.net/carson6931/blog/363234
 IOS 6.0+ Autolayout — UITableViewCell 高度调整
 *
 *  @return <#return value description#>
 */
#import "TableViewController.h"
#import "AutoLayoutTableViewCell.h"
@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *tableView;
    NSMutableArray *nameArray;
    NSMutableArray *imageArray;
    NSMutableArray *descriptionArray;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (isIOS7GE) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    }

    // Do any additional setup after loading the view.
    tableView=[[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tableView)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tableView)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    tableView.dataSource=self;
    tableView.delegate=self;
    if (isIOS7GE) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }

    

    
    nameArray = [NSMutableArray arrayWithObjects:@"海子",@"顾城",@"北岛",nil];
    imageArray = [NSMutableArray arrayWithObjects:@"hz",@"gc",@"bd", nil];
    descriptionArray = [NSMutableArray arrayWithObjects:@"《面朝大海，春暖花开》\n从明天起，做一个幸福的人",@"《远和近》\n你， 一会看我， 一会看云。 我觉得， 你看我时很远， 你看云时很近。",@"《波兰来客》\n那时候我们有梦，关于文学，关于爱情，关于穿越世界的旅行。\n如今我们深夜饮酒，杯子碰到一起，都是梦破碎的声音。", nil];


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     AutoLayoutTableViewCell *cell  = [[AutoLayoutTableViewCell alloc] init];

    
    //calculate
    CGFloat height = [cell calulateHeightWithtTitle:[nameArray objectAtIndex:indexPath.row] desrip:[descriptionArray objectAtIndex:indexPath.row]];

    return height;

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *CellId = @"autoCell";
    AutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (cell == nil) {
        cell = [[AutoLayoutTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellId];
        cell.detailTextLabel.textColor=[UIColor grayColor];
    }
    
    [cell.titleLabel setText:nil];
    [cell.titleLabel setText:[nameArray objectAtIndex:indexPath.row]];
    //补上的几句，给用来显示的DetailLabel 设置最大布局宽度
    CGFloat preMaxWaith =[UIScreen mainScreen].bounds.size.width-108;
    [cell.descriptionLabel setPreferredMaxLayoutWidth:preMaxWaith];
    [cell.descriptionLabel layoutIfNeeded];
    
    
    [cell.descriptionLabel setText:nil];
    [cell.logoImageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
   
    [cell.descriptionLabel setText:[descriptionArray objectAtIndex:indexPath.row]];
    
    return cell;
    
    
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
