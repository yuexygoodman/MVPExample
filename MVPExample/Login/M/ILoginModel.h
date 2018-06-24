//
//  ILoginModel.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef ILoginModel_h
#define ILoginModel_h
#import "IModel.h"
#import "Me.h"

/**
 专门处理登录相关逻辑的模块
 */
@protocol ILoginModel<IModel>

- (void)loginToServer:(NSString *)account pwd:(NSString *)pwd handler:(void(^)(NSError * err)) handler;

@end

#endif /* ILoginModel_h */
