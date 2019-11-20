//
//  MineTableViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/7.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineTableViewCell : UITableViewCell
@property(nonatomic, weak)IBOutlet UILabel *title;
@property(nonatomic, weak)IBOutlet UIImageView *imgView; 
@end

NS_ASSUME_NONNULL_END
