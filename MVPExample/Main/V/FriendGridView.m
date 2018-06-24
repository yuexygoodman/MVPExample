//
//  FriendGridView.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendGridView.h"
#import "FriendViewItem.h"

@interface FriendGridView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(weak,nonatomic)UIViewController * viewController;

@property(weak,nonatomic)id<IFriendPresenter> presenter;

@property(strong,nonatomic)NSMutableArray * friends;

@end

@implementation FriendGridView

///MARK: 初始化
- (id)initWithController:(UIViewController *)viewController {
    UICollectionViewFlowLayout * layout=[UICollectionViewFlowLayout new];
    layout.itemSize=CGSizeMake(70, 90);
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=10;
    if (self=[self initWithFrame:CGRectZero collectionViewLayout:layout]) {
        _viewController=viewController;
        self.delegate=self;
        self.dataSource=self;
        [self registerNib:[UINib nibWithNibName:@"FriendViewItem" bundle:nil] forCellWithReuseIdentifier:@"FriendViewItem"];
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

///MARK: 实现 IFriendView
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

///MARK:实现 UICollectionViewDelegate,UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.friends.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FriendViewItem * itemView=[collectionView dequeueReusableCellWithReuseIdentifier:@"FriendViewItem" forIndexPath:indexPath];
    if (itemView.gestureRecognizers.count==0) {
        itemView.userInteractionEnabled=YES;
        UILongPressGestureRecognizer * longtap=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(selected_item:)];
        [itemView addGestureRecognizer:longtap];
    }
    [itemView configWithFriend:self.friends[indexPath.row]];
    return itemView;
}

///MARK: 用户事件
- (void)selected_item:(UIGestureRecognizer *)sender {
    NSIndexPath * indexPath=[self indexPathForCell:(UICollectionViewCell *)sender.view];
    UIAlertController * sheet=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"删除朋友" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.presenter onRemoveFriend:self.friends[indexPath.row]];
    }]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self.viewController presentViewController:sheet animated:YES completion:nil];
}

@end
