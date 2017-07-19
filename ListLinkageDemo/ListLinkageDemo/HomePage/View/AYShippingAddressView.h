//
//  AYShippingAddressView.h
//  aoyiFarm
//
//  Created by working on 2017/6/26.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class AYReceiptAddressModel;

typedef void(^ChooseAddress)();
typedef void(^SelectedBlock)();

// 收菜地址视图
@interface AYShippingAddressView : UIView

@property (weak, nonatomic) IBOutlet UILabel *consigneeLabel; // 收货人
@property (weak, nonatomic) IBOutlet UIButton *selectBtn; // 选择按钮
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;  // 收货人姓名
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel; // 电话
@property (weak, nonatomic) IBOutlet UILabel *detailAddressLabel; // 地址详情

@property (nonatomic, copy) ChooseAddress chooseAddress; // 跳转选择地址
@property (nonatomic, copy) SelectedBlock selectedBlock; // 勾选地址按钮

//@property (nonatomic, strong) AYReceiptAddressModel *model;

@end
