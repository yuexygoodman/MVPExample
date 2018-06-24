//
//  LoginViewController.m
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "LoginPresenter.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (strong,nonatomic) id<ILoginPresenter> presenter;

@end

@implementation LoginViewController

///MARK: 事件

- (IBAction)login_action:(id)sender {
    if (self.presenter && [self.presenter respondsToSelector:@selector(onLoginWithAccount:pwd:)]) {
        [self.presenter onLoginWithAccount:self.accountField.text pwd:self.pwdField.text];
    }
}
- (IBAction)edit_action:(id)sender {
    [self.view endEditing:YES];
}

///MARK: 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     创建、绑定、启动
     */
    LoginPresenter * presenter=[LoginPresenter new];
    [self setPresenter:presenter];
    [presenter setLoginView:self];
    [presenter start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///MARK: 实现ILoginView

- (void)setPresenter:(id<ILoginPresenter>)presenter {
    _presenter=presenter;
}

- (void)loadWithLastAccount:(NSString *)account pwd:(NSString *)pwd {
    self.accountField.text=account;
    self.pwdField.text=pwd;
}

- (void)showLoginError:(NSString *)err {
    UIAlertController * alert=[UIAlertController alertControllerWithTitle:@"登陆错误" message:err preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showLoading {
    UIActivityIndicatorView * indicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.tag=1000;
    [self.view addSubview:indicator];
    indicator.center=self.view.center;
    [indicator startAnimating];
}

- (void)hideLoading {
    UIActivityIndicatorView * indicator=[self.view viewWithTag:1000];
    [indicator stopAnimating];
    [indicator removeFromSuperview];
}

- (void)navToMain {
    MainViewController * main=[MainViewController new];
    [self.navigationController pushViewController:main animated:YES];
}

@end
