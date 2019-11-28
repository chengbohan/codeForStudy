//
//  HomeNoticeReq.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "HomeNoticeReq.h"

@implementation HomeNoticeReq
- (NSString *)requestUrl {
    return @"/denglong/dn/getAnnouncement";
}

- (id)requestArgument {
    return nil;
}
@end
