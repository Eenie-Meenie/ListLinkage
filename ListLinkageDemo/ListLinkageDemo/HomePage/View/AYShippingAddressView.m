//
//  AYShippingAddressView.m
//  aoyiFarm
//
//  Created by working on 2017/6/26.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import "AYShippingAddressView.h"

@interface AYShippingAddressView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailAddressLableTop;

@end

@implementation AYShippingAddressView

//- (void)setModel:(AYReceiptAddressModel *)model {
//    if (_model != model) {
//        _model = model;
//    }
//    
//    if (model._id.length == 0) {
//        self.selectBtn.enabled = NO;
//        self.detailAddressLableTop.constant = 12;
//        self.detailAddressLabel.text = @"请选择地址";
//        self.detailAddressLabel.font = kkFont17;
//        self.phoneNumberLabel.text = @"";
//        self.nameLabel.text = @"";
//        self.consigneeLabel.text = @"";
//    } else {
//        self.selectBtn.enabled = YES;
//        self.consigneeLabel.text = @"收货人:";
//        self.phoneNumberLabel.text = model.phone_mob;
//        self.nameLabel.text = [NSString stringWithFormat:@"%@", model.consignee];
//        self.detailAddressLabel.text = [NSString stringWithFormat:@"收货地址：%@%@%@",model.region_name,model.city,model.address];
//         self.detailAddressLabel.font = kkFont14;
//        NSDictionary *attrs = @{NSFontAttributeName : kkFont14};
//        CGSize size = [self.detailAddressLabel.text sizeWithAttributes:attrs];
//        
//        if (size.width >  (KKSCREEN_WIDTH - 98)) {
//            self.detailAddressLableTop.constant = 5;
//        } else {
//            self.detailAddressLableTop.constant = 10;
//        }
//    }
//}

#pragma mark - handle action
// 选择地址按钮 -- 跳转到地址选择界面
- (IBAction)chooseAddress:(UIButton *)sender {
    if (self.chooseAddress) {
         self.chooseAddress();
    }
}

// 勾选地址按钮 -- 勾选地址
- (IBAction)selectAddress:(UIButton *)sender {
    if (self.selectedBlock) {
        self.selectedBlock();
    }
}


@end
