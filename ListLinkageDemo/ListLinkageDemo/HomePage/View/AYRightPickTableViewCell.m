//
//  AYRightPickTableViewCell.m
//  aoyiFarm
//
//  Created by working on 2017/6/26.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import "AYRightPickTableViewCell.h"
//#import "AYvegetableModel.h"

@implementation AYRightPickTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.presentImage addTapAction:@selector(checkVegetable:) target:self];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(AYvegetableModel *)model {
    if (_model != model) {
        _model = model;
    }
    
    self.nameLabel.text = model.vegname;
    self.timeLabel.text = [NSString stringWithFormat:@"%@至%@", model.expectmaturity, model.maturitydate];
    // 价格 = 单价 * 重量
    CGFloat money = [model.price floatValue] * [model.weight floatValue];
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %.2f", money];
    self.forecastProductionLabel.text = [NSString stringWithFormat:@"预估: %@kg",model.weight];
    self.presentImage.image = [UIImage imageNamed:@"caidi_zhanwei"];
//    [self.presentImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,model.small_pic]] placeholderImage:[UIImage imageNamed:@"caidi_zhanwei"] options:SDWebImageAllowInvalidSSLCertificates];
    // 更改选中状态
    if (!model.isSected) {
        self.selectedBtn.selected = NO;
    } else {
        self.selectedBtn.selected = YES;
    }
}

#pragma mark - handle action
// 图片按钮点击事件
- (void)checkVegetable:(UITapGestureRecognizer *)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(checkVegetable:pickTableViewCell:)]) {
        [self.delegate checkVegetable:sender pickTableViewCell:self];
    }
}

// 选择按钮
- (IBAction)selectedBtn:(UIButton *)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(selectedBtn:pickTableViewCell:)]) {
        [self.delegate selectedBtn:sender pickTableViewCell:self];
    }
}

@end
