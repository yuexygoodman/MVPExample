//
//  User.h
//  MVPExample
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "ModelData.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,SexType) {
    SexMale,
    SexFemale
};

@interface User : ModelData

@property(strong,nonatomic)NSString * nickName;//昵称

@property(assign,nonatomic)SexType sex;//性别

@property(assign,nonatomic)NSUInteger age;//年龄

@property(readonly,strong,nonatomic)UIImage * headImg;//头像

@property(strong,nonatomic)NSString * signature;//个性签名 

@end
