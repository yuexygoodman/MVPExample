//
//  IFriendView.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef IFriendView_h
#define IFriendView_h
#import "Friend.h"
#import "IFriendPresenter.h"

@protocol IFriendView<NSObject>

- (void)setPresenter:(id<IFriendPresenter>)presenter;

- (void)loadWithFriends:(NSArray<Friend *> *)friends;//显示列表

- (void)confirmFriend:(Friend *)fri msg:(NSString *)msg;//向用户展示再次确认窗口

- (void)unShowingForFriend:(Friend *)fri;//取消被删除朋友的显示

- (void)showRemoveError:(NSString *)msg;//显示错误

@end

#endif /* IFriendView_h */
