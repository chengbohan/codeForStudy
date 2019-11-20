//
//  ItemBarView.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemBarView : UIView
@property(nonatomic, weak)IBOutlet UIView *item1;
@property(nonatomic, weak)IBOutlet UIView *item2;
@property(nonatomic, weak)IBOutlet UILabel *lab1;
@property(nonatomic, weak)IBOutlet UILabel *lab2;
@property(nonatomic, weak)IBOutlet UIView *color1;
@property(nonatomic, weak)IBOutlet UIView *color2;
@property(nonatomic, weak)IBOutlet UIView *view;
- (void)clickItemBlock:(void (^)(NSInteger index))clickBlock;
@end

NS_ASSUME_NONNULL_END
