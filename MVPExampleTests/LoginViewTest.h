//
//  LoginViewTest.h
//  MVPExampleTests
//
//  Created by Good Man on 2018/6/24.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginView.h"

/**
 用于测试业务，通过简单的实现一个ILoginView的接口，就可以让整个业务逻辑跑起来，这也就是MVP提高了业务的可测试性的原因。
 */
@interface LoginViewTest : NSObject<ILoginView>

@property(strong,nonatomic)NSString * msg;

- (void)doUserActionForLogin:(NSString *)account pwd:(NSString *)pwd;

@end
