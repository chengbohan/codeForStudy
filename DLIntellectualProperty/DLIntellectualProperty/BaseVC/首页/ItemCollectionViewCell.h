//
//  ItemCollectionViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak)IBOutlet UILabel *labA;
@property (nonatomic, weak)IBOutlet UILabel *labB;
@property (nonatomic, weak)IBOutlet UIImageView *imgView;
@end

NS_ASSUME_NONNULL_END
