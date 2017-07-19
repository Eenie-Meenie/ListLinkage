//
//  LSConstantValue.h
//  LoveSurprise
//
//  Created by lijubin on 2016/11/25.
//  Copyright © 2016年 viewcreator3d. All rights reserved.
//

#ifndef LSConstantValue_h
#define LSConstantValue_h


#endif /* LSConstantValue_h */

#define AppDelegateAccessor ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//QQ
#define QQAppId @"1105784981"
#define QQSecret @"vSSv41FDZf1yPIoo"
//新浪微博
#define WeiBoAppKey @"2021060910"
#define WeiBoSecret @"6ad2edb611a860e481b769de4cbeb69e"
#define WeiboRedirect @"https://api.weibo.com/oauth2/default.html"

//微信
#define WeiXinAppId @"wx383da14fe8636fee"
#define WeiXinSecret @"b43fa593df42fa5e65d5cd2d95f047d7"
#define redirectURL @"http://www.baidu.com"

// 萤石
#define EzvizAppKey @"062f0718a1504aa7b6a5e6c7b348804d"
#define EZPushAppSecret @"aa03a8b81a7dbba11ddcbb17c93bbbf2"

// blugly
#define BluglyAppID @"ce4c8a4569"
#define BluglyAppKey @"8e8b0836-5ff6-448f-9698-01dee3bd6875"

//环信
#define EMAppKey @"1174161213115377#aijingxi"
#define EMApnsCertName @"aijingxiDev"
#define EMUserName [NSString stringWithFormat:@"im_%@",[AYPublicTool sharedInstance].userInfo.userid]
#define EMPassWord [[EMUserName md5String] uppercaseString]
#define EMUserFriendName(userId) [NSString stringWithFormat:@"im_%@",userId]

#define IntToString(integer) [NSString stringWithFormat:@"%zd",integer]
#define FloatToString(float) [NSString stringWithFormat:@"%f",float]
#define IntToNumber(number) [NSNumber numberWithInteger:number]

#define KKSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define KKSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KKWIDTH(view) (view.frame.size.width)
#define KKHEIGHT(view) (view.frame.size.height)
#define KKGetMaxX(view) CGRectGetMaxX(view.frame)
#define KKGetMaxY(view) CGRectGetMaxY(view.frame)

#define kkPadding 10

#define kk_lightPinkColor [UIColor colorWithRed:250/255.0 green:93/255.0 blue:91/255.0 alpha:1.0]
#define kk_lightblackBg [UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1.0]
#define kkLightGrayBg [UIColor colorWithRed:245/255.0 green:246/255.0 blue:250/255.0 alpha:1.0]


#define kkFont10 [UIFont fontWithName:@"Avenir-Light" size:10]
#define kkFont11 [UIFont fontWithName:@"Avenir-Light" size:11]
#define kkFont12 [UIFont fontWithName:@"Avenir-Light" size:12]
#define kkFont13 [UIFont fontWithName:@"Avenir-Light" size:13]
#define kkFont14 [UIFont fontWithName:@"Avenir-Light" size:14]
#define kkFont15 [UIFont fontWithName:@"Avenir-Light" size:15]
#define kkFont15_h [UIFont fontWithName:@"Avenir-Heavy" size:15]
#define kkFont16 [UIFont fontWithName:@"Avenir-Light" size:16]
#define kkFont17 [UIFont fontWithName:@"Avenir-Light" size:17]
#define kkFont18 [UIFont fontWithName:@"Avenir-Light" size:18]
#define kkFont19 [UIFont fontWithName:@"Avenir-Light" size:19]
#define kkFont20 [UIFont fontWithName:@"Avenir-Light" size:20]

#define kkFont25 [UIFont fontWithName:@"Avenir-Light" size:25]
#define kkFont35 [UIFont fontWithName:@"Avenir-Heavy" size:35]


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kThemeColor [UIColor colorWithRed:96.f / 255 green:174.f / 255  blue:88.f / 255 alpha:1]

#define kTintColor [UIColor colorWithRed:75.f / 255 green:75.f / 255 blue:75.f / 255 alpha:1]

#define kLineColor [UIColor colorWithRed:229.f / 255 green:229.f / 255 blue:229.f / 255 alpha:1]
#define kBlackTextColor [UIColor colorWithRed:75.f / 255 green:75.f / 255 blue:75.f / 255 alpha:1]
#define kOrangeTextColor [UIColor colorWithRed:250.f / 255 green:140.f / 255 blue:40.f / 255 alpha:1]
#define KLightYellowColor [UIColor colorWithRed:254.f / 255 green:247.f / 255 blue:238.f / 255 alpha:1]
#define KDarkGreyColor [UIColor colorWithRed:153.f / 255 green:153.f / 255 blue:153.f / 255 alpha:1]
#define KightBlueColor [UIColor colorWithRed:100.f / 255 green:156.f / 255 blue:237.f / 255 alpha:1]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#ifdef DEBUG
#define DLog(...) NSLog(@"%s(%d) %@", __PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define DLog(...) ((void)0)
#endif

