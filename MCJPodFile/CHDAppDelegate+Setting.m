//
//  CHDAppDelegate+Setting.m
//  Cashier
//
//  Created by ZhangHonglin on 16/8/1.
//  Copyright © 2016年 ChengDao. All rights reserved.
//

#import "CHDAppDelegate+Setting.h"
#import "CHDSystemParameter.h"
#import <XKSCommonSDK/XKSSystemObj.h>
#import <XKSLoginModule/XLLoginResponse.h>
#import <CHDCommonModule.h>

@implementation CHDAppDelegate (Setting)

/*!
 *  @author HonglinZhang, 16-08-01 09:08:10
 *
 *  @brief 设置域名+签名等信息
 */
+ (void)setSystemParameter {
    XKSSystemObj *obj = [XKSSystemObj shareXKSSystemObj];
    obj.customDomain = API_HOST;
    obj.appKey = SIGN_APP_ID;
    obj.encryptType = XKSEncryptType_MD5;
    obj.md5Secret = SIGN_SECRET;
    obj.aes_Secret = @"xpos1qazZSE$xpos";
    obj.signaterEnable = YES;
    obj.validateEnable = YES;
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    infoDictionary[@"CFBundleExecutable"]
    NSString *deviceInfo = [NSString stringWithFormat:@"%@/%@ (iPad;iOS%@; Scale/2.00)",@"Coffee",infoDictionary[@"CFBundleShortVersionString"],infoDictionary[@"DTPlatformVersion"]];
    obj.customRequestHeader = @{@"App-Type": @"x-common",@"User-Agent":deviceInfo};
}

/*!
 *  @author HonglinZhang, 16-08-04 14:08:47
 *
 *  @brief 设置操作员+班次号+设备号等信息
 *
 *  @param user 登录信息
 */
+ (void)setUserParameter:(XLLoginResponse *)user {
    [XKSSystemObj shareXKSSystemObj].shopId = [NSString stringWithFormat:@"%zi", user.mid];
    [XKSSystemObj shareXKSSystemObj].deviceNumber = FixNull(user.deviceNumber, @"");
    [XKSSystemObj shareXKSSystemObj].operatorId = [NSString stringWithFormat:@"%zi", user.operatorId];
    [XKSSystemObj shareXKSSystemObj].operatorSessionCode = FixNull(user.sessionCode, @"");
}

/**
 *  @brief 设置网络监听
 */
+ (void)setNetworkReachability {
    [CHDNetworkReachability startNotifier];
}

@end
