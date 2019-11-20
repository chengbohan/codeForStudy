//
//  DLTabBarVC.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/17.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLTabBarVC : UITabBarController
- (void)addChildVC:(NSString *)classStr title:(NSString *)titleStr normalImg:(NSString *)normalImgStr selectImg:(NSString *)selectImgStr;
@end

NS_ASSUME_NONNULL_END
