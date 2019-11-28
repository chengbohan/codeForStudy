//
//  SignInModel.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "SignInModel.h"
@implementation SignInData
@end
@implementation SignInModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [SignInData class]};
}
@end
