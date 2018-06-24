//
//  FriendViewItem.h
//  MVPExample
//
//  Created by Good Man on 2018/6/23.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface FriendViewItem : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

- (void)configWithFriend:(Friend *)fri;

@end
