//
//  MessageTableViewCell.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : DLTableViewCell
@property(nonatomic, weak)IBOutlet UIImageView *avatarImg;
@property(nonatomic, weak)IBOutlet UILabel *title;
@property(nonatomic, weak)IBOutlet UILabel *content;
@property(nonatomic, weak)IBOutlet UIView *tagView;
@property(nonatomic, weak)IBOutlet UILabel *timeLab;
@property(nonatomic, weak)IBOutlet UIImageView *arrowImg;
@end

NS_ASSUME_NONNULL_END
