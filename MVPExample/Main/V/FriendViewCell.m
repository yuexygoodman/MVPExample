//
//  FriendViewCell.m
//  MVPExample
//
//  Created by Good Man on 2018/6/21.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendViewCell.h"

@implementation FriendViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithData:(Friend *)fri {
    self.imageView.image=fri.headImg;
    self.nameLabel.text=fri.nickName;
    self.signatureLabel.text=fri.signature;
}

@end
