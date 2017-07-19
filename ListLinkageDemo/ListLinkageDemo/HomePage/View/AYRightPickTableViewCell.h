//
//  AYRightPickTableViewCell.h
//  aoyiFarm
//
//  Created by working on 2017/6/26.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AYRightPickTableViewCell;
@class AYvegetableModel;
@protocol AYRightPickTableViewCellDelegate <NSObject>
// 选择菜品按钮
@optional
- (void)selectedBtn:(UIButton *)sender pickTableViewCell:(AYRightPickTableViewCell *)cell;
// 图片按钮点击事件
- (void)checkVegetable:(UITapGestureRecognizer *)sender pickTableViewCell:(AYRightPickTableViewCell *)cell;
@end

// 收菜界面自定义单元格
@interface AYRightPickTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *presentImage; // 图片
@property (weak, nonatomic) IBOutlet UILabel *nameLabel; // 蔬菜名
@property (weak, nonatomic) IBOutlet UILabel *timeLabel; // 时间
@property (weak, nonatomic) IBOutlet UILabel *forecastProductionLabel; // 预估产量
@property (weak, nonatomic) IBOutlet UILabel *priceLabel; // 价格
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn; // 选中按钮

@property (nonatomic, strong) AYvegetableModel *model; // 蔬菜模型

@property (nonatomic, assign) id<AYRightPickTableViewCellDelegate>delegate;

@end
