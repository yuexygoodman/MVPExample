//
//  ILoginPresenter.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef ILoginPresenter_h
#define ILoginPresenter_h

@protocol ILoginView;

@protocol ILoginPresenter<NSObject>

- (void)setLoginView:(id<ILoginView>)loginView;

- (void)start;

- (void)onLoginWithAccount:(NSString *)account pwd:(NSString *)pwd;//处理登录逻辑

@end

#endif /* ILoginPresenter_h */
