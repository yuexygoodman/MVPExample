//
//  User.m
//  MVPExample
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "User.h"

@implementation User

- (UIImage *)headImg {
    UIImage * img=nil;
    switch (self.sex) {
        case SexFemale:
            img=[UIImage imageNamed:@"sex_female"];
            break;
        case SexMale:
        default:
            img=[UIImage imageNamed:@"sex_male"];
            break;
    }
    return img;
}

@end
