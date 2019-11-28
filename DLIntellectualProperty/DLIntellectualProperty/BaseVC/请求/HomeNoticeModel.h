//
//  HomeNoticeModel.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface HomeNoticeData : NSObject
@property(nonatomic, strong)NSString *title;
@end


@interface HomeNoticeModel : BaseModel
@property(nonatomic, strong)NSArray<HomeNoticeData *> *data;
@end

NS_ASSUME_NONNULL_END
