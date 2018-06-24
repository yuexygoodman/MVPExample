//
//  MainViewController.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "MainViewController.h"
#import "FriendListView.h"
#import "FriendGridView.h"
#import "FriendPresenter.h"

@interface MainViewController ()

@property(strong,nonatomic)UIView<IFriendView> * listView;

@property(strong,nonatomic)UIView<IFriendView> * gridView;

@property(strong,nonatomic)id<IFriendPresenter> friendPresenter;

@end

@implementation MainViewController

///MARK: 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的朋友";
    [self configUI];
    
    //绑定
    self.friendPresenter=[FriendPresenter new];
    [self.listView setPresenter:self.friendPresenter];
    [self.gridView setPresenter:self.friendPresenter];
    
    //启动
    [self.friendPresenter setFriendView:self.listView];
    [self.friendPresenter start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

///MARK: 组织子视图
- (void)configUI {
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Grid" style:UIBarButtonItemStylePlain target:self action:@selector(toChangeLayout:)];
    
    FriendListView * listView=[[FriendListView alloc] initWithController:self];
    FriendGridView * gridView=[[FriendGridView alloc] initWithController:self];
    [self.view addSubview:listView];
    [self.view addSubview:gridView];
    listView.frame=self.view.bounds;
    gridView.frame=self.view.bounds;
    listView.hidden=NO;
    gridView.hidden=YES;
    self.listView=listView;
    self.gridView=gridView;
}

///MARK: 用户事件
- (void)toChangeLayout:(id)sender {
    self.listView.hidden=!self.listView.hidden;
    self.gridView.hidden=!self.gridView.hidden;
    [self.friendPresenter setFriendView:self.listView.hidden?self.gridView:self.listView];
    self.navigationItem.rightBarButtonItem.title=self.listView.hidden?@"List":@"Grid";
    [self.friendPresenter start];
}

@end
