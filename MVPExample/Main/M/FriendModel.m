//
//  FriendModel.m
//  MVPExample
//
//  Created by Good Man on 2018/6/20.
//  Copyright © 2018年 Good Man. All rights reserved.
//

#import "FriendModel.h"

static NSMutableArray * st_friends;

@implementation FriendModel

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static FriendModel * st_friend_model;
    dispatch_once(&onceToken, ^{
        if (!st_friend_model) {
            st_friend_model=[FriendModel new];
        }
    });
    return st_friend_model;
}

/**
 这里用本地数据充当网络数据了
 
 @param handler 回调
 */
- (void)getFriendsWithHandler:(void (^)(NSArray<Friend *> *, NSError *))handler {
    if (!st_friends) {
        NSArray * arr=@[@{@"name":@"张小懒",@"sex":@(0),@"signature":@"你是我的菜。",@"intimacy":@(50)},
                        @{@"name":@"李红印",@"sex":@(1),@"signature":@"终于找到你，我的未来老婆。",@"intimacy":@(51)},
                        @{@"name":@"沐雪琪",@"sex":@(0),@"signature":@"活着是为了什么，难道是为了还房贷吗？",@"intimacy":@(33)},
                        @{@"name":@"钟梦",@"sex":@(0),@"signature":@"别把我的真心当傻子，好吗？",@"intimacy":@(29)},
                        @{@"name":@"张武",@"sex":@(1),@"signature":@"真心不再耍朋友了，伤心了。",@"intimacy":@(88)},
                        @{@"name":@"李青",@"sex":@(0),@"signature":@"今天逛超市什么都没买，我还是女生吗？",@"intimacy":@(77)},
                        @{@"name":@"赵强",@"sex":@(1),@"signature":@"找工作，找工作，找工作。。。。",@"intimacy":@(2)},
                        @{@"name":@"赵星宇",@"sex":@(0),@"signature":@"哇，终于星期五了，青青我来了！",@"intimacy":@(67)},
                        @{@"name":@"李振",@"sex":@(0),@"signature":@"谁也别想从我这儿捞到好处，包括你，你不配。",@"intimacy":@(55)},
                        @{@"name":@"宋晓丽",@"sex":@(0),@"signature":@"good good study,day day up.",@"intimacy":@(34)},
                        @{@"name":@"宋云生",@"sex":@(1),@"signature":@"我老爹真能吹，60年代四川的黑老大。。。这我能信？",@"intimacy":@(66)},
                        @{@"name":@"姜成",@"sex":@(0),@"signature":@"姜还是老的辣啊，什么时候我才能超越我师傅。",@"intimacy":@(68)},
                        @{@"name":@"左中堂",@"sex":@(0),@"signature":@"媳妇我错了，开开门呗，我都快被冻傻了。",@"intimacy":@(77)},
                        @{@"name":@"曾史侯",@"sex":@(1),@"signature":@"血的教训啊！",@"intimacy":@(99)},
                        @{@"name":@"唐云",@"sex":@(1),@"signature":@"一个字，贱",@"intimacy":@(65)},
                        @{@"name":@"赵静",@"sex":@(0),@"signature":@"生活永远都不会垂帘可怜的人。",@"intimacy":@(61)},
                        @{@"name":@"周明霞",@"sex":@(0),@"signature":@"谁要买房，80平小套三，私聊可议价",@"intimacy":@(23)},
                        @{@"name":@"房子桥",@"sex":@(1),@"signature":@"真心来不起了，媳妇明晚再来吧。。。。",@"intimacy":@(16)},
                        @{@"name":@"李小冉",@"sex":@(0),@"signature":@"天台山一日游，有一起的吗",@"intimacy":@(45)},
                        @{@"name":@"普贤坤",@"sex":@(0),@"signature":@"程序员悲吹的一天终于结束了，哈哈哈哈",@"intimacy":@(55)},
                        @{@"name":@"李毅冰",@"sex":@(0),@"signature":@"大哥",@"intimacy":@(28)},
                        @{@"name":@"赵冰雨",@"sex":@(0),@"signature":@"南充，我来也",@"intimacy":@(78)},
                        @{@"name":@"史进",@"sex":@(1),@"signature":@"下雨了，回家收衣服啦",@"intimacy":@(83)},
                        @{@"name":@"乔丽",@"sex":@(1),@"signature":@"真诚所致，金石为开。",@"intimacy":@(78)},
                        @{@"name":@"阵奎",@"sex":@(1),@"signature":@"做一个高尚的人、有道德的人、脱离了低级趣味的人",@"intimacy":@(89)},
                        @{@"name":@"孙俪",@"sex":@(0),@"signature":@"哎，明争暗斗的公司",@"intimacy":@(81)},
                        @{@"name":@"孙子蓝",@"sex":@(0),@"signature":@"哦嚯",@"intimacy":@(52)},
                        @{@"name":@"付奎",@"sex":@(1),@"signature":@"强",@"intimacy":@(35)},
                        @{@"name":@"江青",@"sex":@(0),@"signature":@"binggo，明天就去超市买一斤小龙虾自己照着做。",@"intimacy":@(75)}];
        NSMutableArray * friends=[NSMutableArray new];
        for (NSDictionary * dict in arr) {
            Friend * friend=[Friend new];
            friend.nickName=dict[@"name"];
            friend.sex=[dict[@"sex"] integerValue];
            friend.signature=dict[@"signature"];
            friend.intimacy=[dict[@"intimacy"] floatValue];
            [friends addObject:friend];
        }
        st_friends=[friends mutableCopy];
    }
    handler(st_friends,nil);
}

//删除朋友的逻辑忽略
- (void)deleteFriend:(Friend *)fri handler:(void (^)(NSError *))handler {
    NSLog(@"删除朋友");
    [st_friends removeObject:fri];
    handler(nil);
}

@end
