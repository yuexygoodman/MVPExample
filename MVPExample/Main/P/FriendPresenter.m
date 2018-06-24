//
//  FriendPresenter.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendPresenter.h"
#import "FriendModel.h"
#import "IFriendView.h"

@interface FriendPresenter()

@property(weak,nonatomic)id<IFriendView> friendView;

@property(weak,nonatomic)id<IFriendModel> friendModel;

@end

@implementation FriendPresenter

///MARK: 实现IFriendPresenter
- (void)setFriendView:(id<IFriendView>)friendView {
    _friendView=friendView;
}

- (void)start {
    [self.friendModel getFriendsWithHandler:^(NSArray<Friend *> *friends, NSError *err) {
        [self.friendView loadWithFriends:friends];
    }];
}

- (void)onRemoveFriend:(Friend *)fri {
    if (fri.intimacy>50) {
        [self.friendView confirmFriend:fri msg:[NSString stringWithFormat:@"你跟%@的亲密度达到了%d，仍然要删除Ta吗？",fri.nickName,(int)fri.intimacy]];
    }
    else {
        [self onSureRemoveFriend:fri];
    }
}

- (void)onSureRemoveFriend:(Friend *)fri {
    [self.friendModel deleteFriend:fri handler:^(NSError *err) {
        if (err) {
            [self.friendView showRemoveError:err.description];
        }
        else
            [self.friendView unShowingForFriend:fri];
    }];
}

///MARK: 懒加载
- (id<IFriendModel>)friendModel {
    if (!_friendModel) {
        _friendModel=[FriendModel shared];
    }
    return _friendModel;
}

@end
