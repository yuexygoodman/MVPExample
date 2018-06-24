//
//  LoginPresenter.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "LoginPresenter.h"
#import "LoginModel.h"

@interface LoginPresenter()

@property(weak,nonatomic)id<ILoginView> loginView;
@property(weak,nonatomic)id<ILoginModel> loginModel;

@end

@implementation LoginPresenter

///MARK: 实现ILoginPresenter

- (void)setLoginView:(id<ILoginView>)loginView {
    _loginView=loginView;
}

- (void)start {
    NSString * account=nil;
    NSString * pwd=nil;
    [self getLastAccount:&account pwd:&pwd];
    [self.loginView loadWithLastAccount:account pwd:pwd];
}

//登陆逻辑
- (void)onLoginWithAccount:(NSString *)account pwd:(NSString *)pwd {
    NSString * err=nil;
    if (![self validateAccount:account error:&err] || ![self validatePwd:pwd error:&err]) {
        [self.loginView showLoginError:err];
    }
    else {
        [self.loginView showLoading];
        [self.loginModel loginToServer:account pwd:pwd handler:^(NSError *err) {
            [self.loginView hideLoading];
            if (err) {
                [self.loginView showLoginError:err.description];
            }
            else{
                [self setLastAccount:account pwd:pwd];
                [self.loginView navToMain];
            }
        }];
    }
}

///MARK: 内部方法

//取出上次登陆成功的账号
- (void)getLastAccount:(NSString **)account pwd:(NSString **)pwd {
    *account=[[NSUserDefaults standardUserDefaults] objectForKey:@"last_account"];
    *pwd=[[NSUserDefaults standardUserDefaults] objectForKey:@"last_pwd"];
}

//缓存当前登陆成功的账号
- (void)setLastAccount:(NSString *)account pwd:(NSString *)pwd {
    [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"last_account"];
    [[NSUserDefaults standardUserDefaults] setObject:pwd forKey:@"last_pwd"];
}

//验证账号
- (BOOL)validateAccount:(NSString *)account error:(NSString **)err {
    NSRegularExpression * regular=[NSRegularExpression regularExpressionWithPattern:@"^[0-9]{11}$" options:0 error:nil];
    if ([regular numberOfMatchesInString:account options:0 range:NSMakeRange(0, account.length)]>0) {
        return YES;
    }
    else{
        *err=@"请输入11数字作为账号！";
        return NO;
    }
}

//验证密码
- (BOOL)validatePwd:(NSString *)pwd error:(NSString **)err {
    NSRegularExpression * regular=[NSRegularExpression regularExpressionWithPattern:@"^[^\u4e00-\u9fa5]{6,11}$" options:0 error:nil];
    if ([regular numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwd.length)]>0) {
        return YES;
    }
    else {
        *err=@"请输入6-11位非汉字字符作为密码！";
        return NO;
    }
}

//MARK: 懒加载

- (id<ILoginModel>)loginModel {
    if (!_loginModel) {
        _loginModel=[LoginModel shared];//如果想切换底层的登陆模块，修改这里
    }
    return _loginModel;
}

@end
