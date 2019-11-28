//
//  SignInModel.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignInData : NSObject
@property(nonatomic, strong)NSString *JSESSIONID;
@property(nonatomic, assign)NSInteger id;
@property(nonatomic, strong)NSArray<NSString *> *roleList;
@property(nonatomic, strong)NSString *jobNumber;
@end

@interface SignInModel : BaseModel
@property(nonatomic, strong)SignInData *data;
@end

NS_ASSUME_NONNULL_END
