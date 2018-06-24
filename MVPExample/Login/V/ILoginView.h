//
//  ILoginView.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef ILoginView_h
#define ILoginView_h
#import "ILoginPresenter.h"

@protocol ILoginView<NSObject>

- (void)setPresenter:(id<ILoginPresenter>)presenter;

- (void)loadWithLastAccount:(NSString *)account pwd:(NSString *)pwd;//显示历史账号

- (void)showLoginError:(NSString *)err;//显示登陆错误

- (void)showLoading;//显示正在登陆

- (void)hideLoading;//登陆完成后隐藏

- (void)navToMain;//切换界面到主界面

@end

#endif /* ILoginView_h */
