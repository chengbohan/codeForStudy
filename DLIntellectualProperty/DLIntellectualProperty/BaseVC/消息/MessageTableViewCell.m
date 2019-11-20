//
//  MessageTableViewCell.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _tagView.layer.cornerRadius = 2.5;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
