//
//  QuestionTableViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionTableViewCell : UITableViewCell
@property(nonatomic, weak)IBOutlet UILabel *timeLab;
@property(nonatomic, weak)IBOutlet UILabel *titleLab;
@end

NS_ASSUME_NONNULL_END
