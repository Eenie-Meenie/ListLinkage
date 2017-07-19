//
//  AYLeftPickTableViewCell.m
//  aoyiFarm
//
//  Created by working on 2017/6/26.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import "AYLeftPickTableViewCell.h"

@implementation AYLeftPickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
        // Configure the view for the selected state
    self.contentView.backgroundColor = selected ? KLightYellowColor : [UIColor clearColor];
//    self.highlighted = selected;
    self.titleLabel.textColor =  selected ? kOrangeTextColor : [UIColor blackColor];
}

@end
