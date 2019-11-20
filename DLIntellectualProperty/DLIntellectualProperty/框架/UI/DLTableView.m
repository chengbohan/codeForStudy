//
//  DLTableView.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/19.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLTableView.h"

@implementation DLTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setUI];
    return self;
}



- (void)setUI {
    //垂直滚动条
    self.showsVerticalScrollIndicator = NO;
    //水平滚动条
    self.showsHorizontalScrollIndicator = NO;
    //取消系统自带cell分割线
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    //列表背景灰
    self.backgroundColor = [UIColor colorNamed:@"StandardViewBgColor"];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
