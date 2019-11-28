//
//  BaseModel.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
@property(nonatomic, assign)NSInteger status;
@property(nonatomic, strong)NSString *msg;
@end

NS_ASSUME_NONNULL_END
