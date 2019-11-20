//
//  LineView.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/13.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "LineView.h"

@implementation LineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//- (void)drawRect:(CGRect)rect {
//  CGContextRef context =UIGraphicsGetCurrentContext();
//   // 设置线条的样式
//   CGContextSetLineCap(context, kCGLineCapRound);
//   // 绘制线的宽度
//   CGContextSetLineWidth(context, 3.0);
//   // 线的颜色
//   CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
//   // 开始绘制
//   CGContextBeginPath(context);
//   // 设置虚线绘制起点
//   CGContextMoveToPoint(context, 10.0, 20.0);
//   // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
//   CGFloat lengths[] = {10,10};
//   // 虚线的起始点
//   CGContextSetLineDash(context, 0, lengths,2);
//   // 绘制虚线的终点
//   CGContextAddLineToPoint(context, 310.0,20.0);
//   // 绘制
//   CGContextStrokePath(context);
//   // 关闭图像
//   CGContextClosePath(context);
//}



@end
