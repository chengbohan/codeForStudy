//
//  LoginModel.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface LoginData : NSObject
@property(nonatomic, strong)NSString *JSESSIONID;
@property(nonatomic, assign)NSInteger id;
@end

@interface LoginModel : BaseModel
@property(nonatomic, strong)LoginData *data;
@end



NS_ASSUME_NONNULL_END
