//
//  IFriendPresenter.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#ifndef IFriendPresenter_h
#define IFriendPresenter_h
#import "Friend.h"

@protocol IFriendView;

@protocol IFriendPresenter<NSObject>

- (void)setFriendView:(id<IFriendView>)friendView;

- (void)start;//启动

- (void)onRemoveFriend:(Friend *)fri;//删除业务

- (void)onSureRemoveFriend:(Friend *)fri;//直接删除

@end

#endif /* IFriendPresenter_h */
