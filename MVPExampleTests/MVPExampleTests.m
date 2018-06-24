//
//  MVPExampleTests.m
//  MVPExampleTests
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginPresenter.h"
#import "LoginViewTest.h"
#import "FriendViewTest.h"
#import "FriendPresenter.h"

@interface MVPExampleTests : XCTestCase

@property(strong,nonatomic)LoginViewTest * loginView;

@property(strong,nonatomic)LoginPresenter * loginPresenter;

@property(strong,nonatomic)FriendViewTest * friendView;

@property(strong,nonatomic)FriendPresenter * friendPresenter;

@end

@implementation MVPExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

///MARK: 测试登录
- (void)testLogin {
    //展现
    LoginViewTest * testView=[LoginViewTest new];
    LoginPresenter * presenter=[LoginPresenter new];
    [testView setPresenter:presenter];
    [presenter setLoginView:testView];
    self.loginView=testView;
    self.loginPresenter=presenter;
    [presenter start];
    
    //登录
    [testView doUserActionForLogin:@"12345" pwd:@"123456789"];//账号格式不对
    NSAssert([testView.msg isEqualToString:@"请输入11数字作为账号！"], @"账号格式不对时，逻辑有问题");
    [testView doUserActionForLogin:@"11111111111" pwd:@"中文密码"];//密码格式不对
    NSAssert([testView.msg isEqualToString:@"请输入6-11位非汉字字符作为密码！"], @"密码格式不对时，逻辑有问题");
    XCTestExpectation * exp=[self expectationWithDescription:@"abc"];
    [testView doUserActionForLogin:@"12345678912" pwd:@"12345678"];//正确的账号密码
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(10);
        NSAssert([testView.msg isEqualToString:@"登录成功"], @"正确的账号密码却没有登录成功");
        [exp fulfill];
    });
    [self waitForExpectations:@[exp] timeout:15];
}

///MARK: 测试我的朋友
- (void)testFriend {
    //展现
    FriendViewTest * testView=[FriendViewTest new];
    FriendPresenter * presenter=[FriendPresenter new];
    [testView setPresenter:presenter];
    [presenter setFriendView:testView];
    self.friendView=testView;
    self.friendPresenter=presenter;
    [presenter start];
    NSAssert([testView.msg isEqualToString:@"展示成功"], @"展现逻辑有问题");
    
    testView.msg=@"";
    //移除亲密度小于50的
    __block Friend * fri=nil;
    [testView.friends enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (((Friend *)obj).intimacy<=50) {
            fri=obj;
            *stop=YES;
        }
    }];
    if (fri) {
        [testView doUserActionForRemoveFriend:fri];
    }
    NSAssert([testView.msg isEqualToString:@"移除了Ta"], @"亲密度不高于50时，逻辑有问题");
    
    testView.msg=@"";
    //移除亲密度大于50的
    fri=nil;
    [testView.friends enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (((Friend *)obj).intimacy>50) {
            fri=obj;
            *stop=YES;
        }
    }];
    if (fri) {
        [testView doUserActionForRemoveFriend:fri];
    }
    NSAssert([testView.msg isEqualToString:@"弹出了确认框,移除了Ta"], @"亲密度高于50时，逻辑有问题");
}

@end
