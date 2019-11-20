//
//  QuestionSelectCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionSelectCell : UITableViewCell
@property(nonatomic, weak)IBOutlet UIImageView *img1;
@property(nonatomic, weak)IBOutlet UIImageView *img2;
@property(nonatomic, weak)IBOutlet UIImageView *img3;
@property(nonatomic, weak)IBOutlet UIImageView *img4;
@property(nonatomic, weak)IBOutlet UILabel *lab1;
@property(nonatomic, weak)IBOutlet UILabel *lab2;
@property(nonatomic, weak)IBOutlet UILabel *lab3;
@property(nonatomic, weak)IBOutlet UILabel *lab4;
@property(nonatomic, weak)IBOutlet UILabel *title;
@property(nonatomic, strong)NSMutableArray *tagArr;
@end

NS_ASSUME_NONNULL_END
