//
//  PolicyTableViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/11.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PolicyTableViewCell : UITableViewCell
@property(nonatomic, weak)IBOutlet UILabel *titleLab;
@property(nonatomic, weak)IBOutlet UILabel *departLab;
@property(nonatomic, weak)IBOutlet UILabel *cityLab;
@property(nonatomic, weak)IBOutlet UILabel *provinceLab;
@property(nonatomic, weak)IBOutlet UILabel *timeLab;
@end

NS_ASSUME_NONNULL_END
