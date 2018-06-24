//
//  FriendViewTest.m
//  MVPExampleTests
//
//  Created by Good Man on 2018/6/24.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendViewTest.h"

@interface FriendViewTest()

@property(weak,nonatomic)id<IFriendPresenter>presenter;

@end

@implementation FriendViewTest

- (void)doUserActionForRemoveFriend:(Friend *)fri {
    [self.presenter onRemoveFriend:fri];
}

- (void)setPresenter:(id<IFriendPresenter>)presenter {
    _presenter=presenter;
}

- (void)loadWithFriends:(NSArray<Friend *> *)friends {
    NSLog(@"展示了所有的朋友");
    _friends=[friends mutableCopy];
    self.msg=@"展示成功";
}

- (void)confirmFriend:(Friend *)fri msg:(NSString *)msg {
    NSLog(@"弹出了确认框");
    self.msg=@"弹出了确认框";
    [self.presenter onSureRemoveFriend:fri];
}

- (void)showRemoveError:(NSString *)msg {
    self.msg=@"出现了错误";
    NSLog(@"删除出错了--%@",msg);
}

- (void)unShowingForFriend:(Friend *)fri {
    self.msg=self.msg.length>0?[NSString stringWithFormat:@"%@,%@",self.msg,@"移除了Ta"]:@"移除了Ta";
    NSLog(@"看不到Ta了");
}

@end
