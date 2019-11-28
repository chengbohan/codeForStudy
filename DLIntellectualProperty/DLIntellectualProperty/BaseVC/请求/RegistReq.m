//
//  RegistReq.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "RegistReq.h"

@implementation RegistReq
- (NSString *)requestUrl {
    return @"/denglong/reg";
}

- (id)requestArgument {
    return @{@"code":self.code,@"mobile":self.mobile};
}
@end
