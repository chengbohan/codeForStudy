//
//  BackBtn.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/15.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "BackBtn.h"

@implementation BackBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI];
}

- (void)setUI {
    [self setTitle:@"返回" forState:UIControlStateNormal];
    [self setImage:DLImage(@"back") forState:UIControlStateNormal];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
}
@end
