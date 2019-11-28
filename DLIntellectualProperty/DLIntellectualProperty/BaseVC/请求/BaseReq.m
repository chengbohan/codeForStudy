//
//  BaseReq.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BaseReq.h"

@implementation BaseReq
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (YTKResponseSerializerType)responseSerializerType
{
    return YTKResponseSerializerTypeHTTP;
}

- (NSDictionary *)requestHeaderFieldValueDictionary {
    return @{@"JSESSIONID": [[NSUserDefaults standardUserDefaults] objectForKey:@"JSESSIONID"]};
}
@end
