//
//  VerifyCodeReq.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "VerifyCodeReq.h"

@implementation VerifyCodeReq
- (NSString *)requestUrl {
    return @"/denglong/code";
}

- (id)requestArgument {
    return @{@"phone":self.phone};
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return nil;
}
@end
