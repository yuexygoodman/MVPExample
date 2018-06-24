//
//  LoginModel.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "BaseModel.h"
#import "ILoginModel.h"

@interface LoginModel : BaseModel<ILoginModel>

+ (instancetype)shared;

@end
