//
//  FriendModel.h
//  MVPExample
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "IFriendModel.h"

/**
 针对朋友模块的一个具体实现，这个用于本地测试的，因为根本没有服务器接口。
 */
@interface FriendModel :BaseModel<IFriendModel>

+ (instancetype)shared;

@end
