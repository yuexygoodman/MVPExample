//
//  FriendViewTest.h
//  MVPExampleTests
//
//  Created by Good Man on 2018/6/24.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFriendView.h"

@interface FriendViewTest : NSObject<IFriendView>

@property(strong,nonatomic)NSString *msg;

@property(strong,nonatomic)NSMutableArray * friends;

- (void)doUserActionForRemoveFriend:(Friend *)fri;

@end
