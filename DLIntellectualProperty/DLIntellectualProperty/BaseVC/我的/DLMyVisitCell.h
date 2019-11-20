//
//  DLMyVisitCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/12.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLMyVisitCell : UITableViewCell
@property (nonatomic, weak)IBOutlet UIImageView *avatar;
@property (nonatomic, weak)IBOutlet UIImageView *stateImg;
@property (nonatomic, weak)IBOutlet UILabel *stateLab;
@property (nonatomic, weak)IBOutlet UILabel *telLab;
@property (nonatomic, weak)IBOutlet UILabel *nameLab;
@property (nonatomic, weak)IBOutlet UILabel *timeLab;
@property (nonatomic, weak)IBOutlet UILabel *companyLab;
@end

NS_ASSUME_NONNULL_END
