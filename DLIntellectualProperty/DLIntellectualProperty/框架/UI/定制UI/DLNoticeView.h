//
//  DLNoticeView.h
//  DLIntellectualProperty
//
//  Created by mac on 2019/11/27.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLNoticeView : UIView
@property(nonatomic, copy)void (^cellClickBlock)(NSInteger index);
@property(nonatomic, strong)NSArray <NSString *>*advertArr;

- (void)cellClickAction:(void (^)(NSInteger index))clickBlock;
- (void)startTime;
@end

NS_ASSUME_NONNULL_END
