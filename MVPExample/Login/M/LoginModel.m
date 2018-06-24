//
//  LoginModel.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static LoginModel * st_loginmodel;
    dispatch_once(&onceToken, ^{
        if (!st_loginmodel) {
            st_loginmodel=[LoginModel new];
        }
    });
    return st_loginmodel;
}

//假装登录成功了
- (void)loginToServer:(NSString *)account pwd:(NSString *)pwd handler:(void (^)(NSError *))handler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
           handler(nil);
        });
    });
}

@end
