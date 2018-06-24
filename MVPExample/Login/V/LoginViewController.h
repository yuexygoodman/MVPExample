//
//  LoginViewController.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILoginView.h"

/**
 1、LoginViewController属于View层，负责创建和组织各种子视图，负责界面的生命周期，视图控制器的名字不是白取的。
 2、登陆模块的特点是：界面子视图不复杂，并且多个子视图共同完成某个业务逻辑。基于下面的原因，我们通过LoginViewController来实现View层接口：
    1）UI本身的代码量小，并不会给Controller带来极大负担，不需要从controller中剥离View。
    2）将那些跟业务直接相关的视图剥离开来，形成单独的类，并使其实现View层的接口（也就是充当MVP中的V角色）是比较麻烦的。
    3）xib的界面组织方式，进一步使Controller减负。
 */
@interface LoginViewController : UIViewController<ILoginView>

@end
