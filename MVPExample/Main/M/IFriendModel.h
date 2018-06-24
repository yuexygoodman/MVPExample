//
//  IFriendModel.h
//  MVPExample
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef IFriendModel_h
#define IFriendModel_h
#import "Friend.h"
#import "IModel.h"

/**
 专门处理朋友相关逻辑的模块。在大项目中，建议将Model层按照业务分割成多个模块，这样有利于扩展和维护。
 */
@protocol IFriendModel<IModel>

- (void)getFriendsWithHandler:(void(^)(NSArray<Friend *>* friends,NSError * err)) handler;

- (void)deleteFriend:(Friend *)fri handler:(void(^)(NSError * err)) handler;

@end

#endif /* IFriendModel_h */
