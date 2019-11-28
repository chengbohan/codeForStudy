//
//  LoginReq.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/26.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "LoginReq.h"

@implementation LoginReq

- (NSString *)requestUrl {
    return @"/denglong/login";
}

- (id)requestArgument {
    return @{@"code":self.code,@"mobile":self.mobile};;
}




@end
