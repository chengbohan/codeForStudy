//
//  FieldTableViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/7.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FieldTableViewCell : UITableViewCell
@property(nonatomic, weak)IBOutlet UILabel *starLab;
@property(nonatomic, weak)IBOutlet UILabel *titleLab;
@property(nonatomic, weak)IBOutlet UILabel *contentLab;
@end

NS_ASSUME_NONNULL_END
