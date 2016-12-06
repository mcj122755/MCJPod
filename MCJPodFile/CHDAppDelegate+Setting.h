//
//  CHDAppDelegate+Setting.h
//  Cashier
//
//  Created by ZhangHonglin on 16/8/1.
//  Copyright © 2016年 ChengDao. All rights reserved.
//

#import "CHDAppDelegate.h"

@class XLLoginResponse;
@interface CHDAppDelegate (Setting)

/*!
 *  @author HonglinZhang, 16-08-01 09:08:10
 *
 *  @brief 设置域名+签名等信息
 */
+ (void)setSystemParameter;

/*!
 *  @author HonglinZhang, 16-08-04 14:08:47
 *
 *  @brief 设置操作员+班次号+设备号等信息
 *
 *  @param user 登录信息
 */
+ (void)setUserParameter:(XLLoginResponse *)user;

/**
 *  @brief 设置网络监听
 */
+ (void)setNetworkReachability;

@end
