//
//  HomeNoticeModel.m
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "HomeNoticeModel.h"
@implementation HomeNoticeData

@end

@implementation HomeNoticeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : [HomeNoticeData class]};
}
@end
