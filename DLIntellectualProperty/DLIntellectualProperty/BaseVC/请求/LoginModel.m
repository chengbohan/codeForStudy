//
//  LoginModel.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "LoginModel.h"
@implementation LoginData

@end

@implementation LoginModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [LoginData class]};
}
@end
