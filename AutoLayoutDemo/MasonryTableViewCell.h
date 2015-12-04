//
//  MasonryTableViewCell.h
//  AutoLayoutDemo
//
//  Created by coderyi on 15/12/4.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MasonryDataEntity;

@interface MasonryTableViewCell : UITableViewCell
- (void)setupData:(MasonryDataEntity *)dataEntity;

@end
