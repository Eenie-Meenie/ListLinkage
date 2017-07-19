//
//  AYCollectFoodModel.m
//  aoyiFarm
//
//  Created by working on 2017/6/28.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import "AYCollectFoodModel.h"
#import "AYvegetableModel.h"
#import "MJExtension.h"

@implementation AYCollectFoodModel

/* 实现该方法，说明数组中存储的模型数据类型 */
+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"farmvegetable" : @"AYvegetableModel"};
}

@end
