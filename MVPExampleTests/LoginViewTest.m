//
//  LoginViewTest.m
//  MVPExampleTests
//
//  Created by Good Man on 2018/6/24.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "LoginViewTest.h"
#import "ILoginPresenter.h"

@interface LoginViewTest()

@property(weak,nonatomic)id<ILoginPresenter>presenter;

@end

@implementation LoginViewTest

//模拟用户登录操作
- (void)doUserActionForLogin:(NSString *)account pwd:(NSString *)pwd {
    [self.presenter onLoginWithAccount:account pwd:pwd];
}

- (void)setPresenter:(id<ILoginPresenter>)presenter {
    _presenter=presenter;
}

- (void)loadWithLastAccount:(NSString *)account pwd:(NSString *)pwd {
    NSLog(@"展示出了登录界面，历史账号(%@:%@)。",account,pwd);
}

- (void)showLoginError:(NSString *)err {
    NSLog(@"展示出了登录错误");
    self.msg=err;
}

- (void)showLoading {
    NSLog(@"正在登录...");
}

- (void)hideLoading {
    NSLog(@"登录结束");
}

- (void)navToMain {
    NSLog(@"成功进入了主界面");
    self.msg=@"登录成功";
}

@end
