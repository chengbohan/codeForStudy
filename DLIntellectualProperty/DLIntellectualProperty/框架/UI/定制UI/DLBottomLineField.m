//
//  DLBottomLineField.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/4.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLBottomLineField.h"

@implementation DLBottomLineField

- (instancetype)init {
    self = [super init];
    
    return self;
}



- (void)addBottomLine {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = DLRGB(191, 191, 191);
    [self addSubview:lineView];
    [lineView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(1);
        make.left.right.equalTo(0);
        make.bottom.equalTo(-1);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
