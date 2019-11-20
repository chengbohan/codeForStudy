//
//  DLAdvertiseView.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/20.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLAdvertiseView : UIView
@property(nonatomic, copy)void (^cellClickBlock)(NSInteger index);
@property(nonatomic, strong)NSArray <NSString *>*advertArr;


- (void)cellClickAction:(void (^)(NSInteger index))clickBlock;
- (void)setCollectionViewLayoutScrollDirction:(UICollectionViewScrollDirection)dirction;
- (void)startTime;
@end

NS_ASSUME_NONNULL_END
