//
//  TradeModel.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TradeTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TradeModel : NSObject
@property(nonatomic, strong)NSArray <TradeTitleModel *> *tradeTitleArr;
@end

NS_ASSUME_NONNULL_END
