//
//  AutoLayoutTableViewCell.m
//  AutoLayoutDemo
//
//  Created by coderyi on 15/6/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AutoLayoutTableViewCell.h"

@implementation AutoLayoutTableViewCell
@synthesize titleLabel,descriptionLabel,logoImageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        titleLabel=[[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        titleLabel.backgroundColor=[UIColor colorWithRed:0.09 green:0.63 blue:0.37 alpha:1];
        titleLabel.textColor=[UIColor whiteColor];
        
        descriptionLabel=[[UILabel alloc] init];
        [self.contentView addSubview:descriptionLabel];
        descriptionLabel.backgroundColor=[UIColor colorWithRed:0.09 green:0.42 blue:0.93 alpha:1];
        descriptionLabel.numberOfLines=0;
        descriptionLabel.textColor=[UIColor whiteColor];
        logoImageView=[[UIImageView alloc] init];

        [self.contentView addSubview:logoImageView];
        titleLabel.translatesAutoresizingMaskIntoConstraints=NO;
          descriptionLabel.translatesAutoresizingMaskIntoConstraints=NO;
          logoImageView.translatesAutoresizingMaskIntoConstraints=NO;
        
        
        NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[titleLabel]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)];
        
        NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[titleLabel(==30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(titleLabel)];
        
        [self.contentView addConstraints:constraints1];
        [self.contentView addConstraints:constraints2];
    
        
        NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[logoImageView(==80)]-8-[descriptionLabel]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(logoImageView,descriptionLabel)];
        
//        5+30+5
        NSArray *constraints4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[logoImageView(==90)]-(>=20)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(logoImageView)];
//        5+30+17
          NSArray *constraints5=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-52-[descriptionLabel]-(>=20)-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(descriptionLabel)];
        
        [self.contentView addConstraints:constraints3];
        [self.contentView addConstraints:constraints4];
        [self.contentView addConstraints:constraints5];
        

        
        
    }
    return self;
}


-(CGFloat)calulateHeightWithtTitle:(NSString*)title desrip:(NSString*)descrip
{
    //这里非常重要
    CGFloat preMaxWaith =[UIScreen mainScreen].bounds.size.width-108;
    [self.descriptionLabel setPreferredMaxLayoutWidth:preMaxWaith];
    [self.titleLabel setText:title];
    //这也很重要
    [self.descriptionLabel layoutIfNeeded];
    [self.descriptionLabel setText:descrip];
    [self.contentView layoutIfNeeded];
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    //加1是关键
    return size.height+1.0f;
}

-(void)layoutSubviews{
    [super layoutSubviews];
 
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
