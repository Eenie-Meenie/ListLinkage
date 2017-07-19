//
//  AYvegetableModel.h
//  aoyiFarm
//
//  Created by working on 2017/3/14.
//  Copyright © 2017年 viewcreator3d. All rights reserved.
//

#import <Foundation/Foundation.h>
// 菜地模型对象
@interface AYvegetableModel : NSObject

@property (nonatomic, strong) NSString *_id;                // 菜地id
@property (nonatomic, strong) NSString *store_id;           // 农场id
@property (nonatomic, strong) NSString *greenhouse_id;      // 大棚id
@property (nonatomic, strong) NSString *name;               // 菜地名
@property (nonatomic, strong) NSString *sort_order;         // 排序方式 几号地
@property (nonatomic, strong) NSString *add_time;           // 添加时间
@property (nonatomic, strong) NSString *buy_time;           //
@property (nonatomic, strong) NSString *close_time;           //

@property (nonatomic, strong) NSString *modify_time;        // 修改时间
@property (nonatomic, strong) NSString *status;             // 状态 0 空地 1待种植 2 已种植（生长中） 3已成熟 4待铲地 5已成熟(上门预约)
@property (nonatomic, strong) NSString *user_id;            // 用户id
@property (nonatomic, strong) NSString *video_id;           // 摄像机id
@property (nonatomic, strong) NSString *greenhouse_number;  // 大棚编号
@property (nonatomic, strong) NSString *number;     // 收菜状态(0:没收过(表示整块可收), 1:收一半, 2:全收(收完了,不可收)
@property (nonatomic, strong) NSString *vegnamemgt_id;       // 菜地名称
@property (nonatomic, strong) NSString *small_number;        // 小块菜地编号
@property (nonatomic, strong) NSString *catgroy_name;        // 已种菜地名字
@property (nonatomic, strong) NSString *vegetablefield_id;   // 菜地id
@property (nonatomic, strong) NSString *vegetablefield_number;   // 菜地编号
@property (nonatomic, strong) NSString *catgroyid;           // 蔬菜id
@property (nonatomic, strong) NSString *catgroy_img;         // 蔬菜图片
@property (nonatomic, strong) NSString *dev_id;
@property (nonatomic, strong) NSString *is_del;
@property (nonatomic, strong) NSString *is_recommend;
@property (nonatomic, strong) NSString *price;              // 单价
@property (nonatomic, strong) NSString *position;            // 位置1:左边 2:中间 3:右边

// 收菜界面使用到的
@property (nonatomic, copy) NSString *yield;
@property (nonatomic, copy) NSString *vegname;  // 菜品名
@property (nonatomic, copy) NSString *weight;   // 重量
@property (nonatomic, copy) NSString *expectmaturity; // 预计成熟时间
@property (nonatomic, copy) NSString *maturitydate;   // 实际成熟时间
@property (nonatomic, copy) NSString *small_pic;  // 图片
@property (nonatomic, copy) NSString *big_pic;  // 图片
@property (assign, nonatomic) NSIndexPath *selIndex; // 选中的蔬菜是在哪一行
@property (nonatomic, copy) NSString *is_buy;  // 1是我的蔬菜,2是自营蔬菜
@property (nonatomic, copy) NSString *total;    // 价格
@property (nonatomic, assign) BOOL isSected;  // 是否选中
@end
