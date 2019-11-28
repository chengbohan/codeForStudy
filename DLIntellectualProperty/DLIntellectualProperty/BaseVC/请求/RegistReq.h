//
//  RegistReq.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BaseReq.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegistReq : BaseReq
@property(nonatomic, strong)NSString *mobile;
@property(nonatomic, strong)NSString *code;
@end

NS_ASSUME_NONNULL_END
