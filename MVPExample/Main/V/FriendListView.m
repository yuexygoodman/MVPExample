//
//  FriendListView.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendListView.h"
#import "FriendViewCell.h"

@interface FriendListView()<UITableViewDelegate,UITableViewDataSource>

@property(weak,nonatomic)id<IFriendPresenter> presenter;

@property(strong,nonatomic)NSMutableArray * friends;

@property(weak,nonatomic)UIViewController * viewController;

@end

@implementation FriendListView

///MARK: 初始化
- (id)initWithController:(UIViewController *)viewController {
    if (self=[self initWithFrame:CGRectZero style:UITableViewStylePlain]) {
        _viewController=viewController;
        self.delegate=self;
        self.dataSource=self;
    }
    return self;
}

///MARK: 实现IFriendView
- (void)setPresenter:(id<IFriendPresenter>)presenter {
    _presenter=presenter;
}

- (void)loadWithFriends:(NSArray<Friend *> *)friends {
    _friends=[friends mutableCopy];
    [self reloadData];
}

- (void)confirmFriend:(Friend *)fri msg:(NSString *)msg {
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"再次确认" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.presenter onSureRemoveFriend:fri];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

- (void)unShowingForFriend:(Friend *)fri {
    [_friends removeObject:fri];
    [self reloadData];
}

- (void)showRemoveError:(NSString *)msg {
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"错误" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

///MARK:实现 UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"FriendViewCell"];
    if (!cell) {
        NSArray * arr=[[NSBundle mainBundle] loadNibNamed:@"FriendViewCell" owner:nil options:nil];
        cell=arr.firstObject;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    [cell configWithData:self.friends[indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.presenter onRemoveFriend:self.friends[indexPath.row]];
}

@end
