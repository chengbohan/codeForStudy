//
//  TradeTitleModel.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TradeSubModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TradeTitleModel : NSObject
@property(nonatomic, strong)NSArray <TradeSubModel *>* tradeSubArr;
@property(nonatomic, strong)NSString *title;
@end

NS_ASSUME_NONNULL_END
