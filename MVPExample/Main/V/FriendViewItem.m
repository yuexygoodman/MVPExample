//
//  FriendViewItem.m
//  MVPExample
//
//  Created by Good Man on 2018/6/23.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendViewItem.h"

@implementation FriendViewItem

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configWithFriend:(Friend *)fri {
    self.headView.image=fri.headImg;
    self.nameLabel.text=fri.nickName;
}

@end
