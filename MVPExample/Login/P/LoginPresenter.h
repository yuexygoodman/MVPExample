//
//  LoginPresenter.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILoginPresenter.h"
#import "ILoginView.h"

/**
 包含了所有的业务逻辑，但不包含UI逻辑
 */
@interface LoginPresenter : NSObject<ILoginPresenter>

@end
