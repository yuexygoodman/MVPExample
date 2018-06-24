//
//  FriendListView.h
//  MVPExample
//
//  Created by Good Man on 2018/6/22.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFriendView.h"

@interface FriendListView : UITableView<IFriendView>

- (id)initWithController:(UIViewController *)viewController;

@end
