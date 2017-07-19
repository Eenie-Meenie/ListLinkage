//
//  AYCollectFoodModel.h
//  aoyiFarm
//
//  Created by working on 2017/6/28.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import <Foundation/Foundation.h>

// 收菜界面列表模型
@interface AYCollectFoodModel : NSObject

@property (nonatomic, copy) NSString *catgroyid;
@property (nonatomic, copy) NSString *vegname;          // 菜品名字
@property (nonatomic, strong) NSMutableArray *farmvegetable;   // 蔬菜列表

@end
