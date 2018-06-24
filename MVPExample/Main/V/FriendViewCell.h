//
//  FriendViewCell.h
//  MVPExample
//
//  Created by Good Man on 2018/6/21.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@interface FriendViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *signatureLabel;

- (void)configWithData:(Friend *)fri;

@end
