//
//  DLAboutUsVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLAboutUsVC.h"

@interface DLAboutUsVC ()

@end

@implementation DLAboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    
    UIScrollView *scroll = [UIScrollView new];
    [self.view addSubview:scroll];
    scroll.showsVerticalScrollIndicator = NO;
    [scroll makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *containerView = [UIView new];
    [scroll addSubview:containerView];
    [containerView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scroll);
        make.width.equalTo(scroll);
    }];
    
    
    UILabel *titleLab =[UILabel new];
    titleLab.text = @"辽宁灯笼知识产权服务有限公司";
    titleLab.font = [UIFont systemFontOfSize:18];
    titleLab.textColor = DLRGBHex(0x333333);
    titleLab.textAlignment = NSTextAlignmentCenter;
    [containerView addSubview:titleLab];
    [titleLab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(31);
        make.left.right.equalTo(0);
        make.height.equalTo(17);
    }];
    
    TYAttributedLabel *label = [[TYAttributedLabel alloc] init];
    [containerView addSubview:label];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"     辽宁灯笼知识产权服务有限公司是响应国家“大众创业、万众创新” 号召，在《中华人民共和国知识产权法》框架内成立的一家集商标交易、专利市场、版权转让、海外技术以及海外人才 引进等领域于一体的专业服务机构。"];
    [attributedString addAttributeTextColor:DLRGBHex(0x333333)];
    [attributedString addAttributeFont:[UIFont systemFontOfSize:15]];
    [attributedString addAttributeCharacterSpacing:2];
    [attributedString addAttributeAlignmentStyle:kCTTextAlignmentLeft lineSpaceStyle:6 paragraphSpaceStyle:2 lineBreakStyle:kCTLineBreakByCharWrapping];
    [label appendTextAttributedString:attributedString];
    [label appendImageWithName:@"aboutUs" size:CGSizeMake(DLScreenWidth - 64, 228)];
    
    
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:@"     公司致力于知识产权行业的深耕、发掘，以“为社会提供更为便捷的知识产权转让方式，提升全民知识产权保护意识”为宗旨，以“诚信为本，服务至上”为经营理念，以“追求客户的信赖”为目标，用精细化的管理+专业的服务开拓市场，为企业提供更加省心、全面、专业、有保障的一站式服务，助力企业持续发展和全面提升。"];
    [attributedString1 addAttributeTextColor:DLRGBHex(0x333333)];
    [attributedString1 addAttributeFont:[UIFont systemFontOfSize:15]];
    [attributedString1 addAttributeCharacterSpacing:2];
    [attributedString1 addAttributeAlignmentStyle:kCTTextAlignmentLeft lineSpaceStyle:6 paragraphSpaceStyle:2 lineBreakStyle:kCTLineBreakByCharWrapping];
    [label appendTextAttributedString:attributedString1];

    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(20);
        make.left.equalTo(32);
        make.right.equalTo(-32);
        make.height.equalTo([label getHeightWithWidth:DLScreenWidth - 64]);
    }];
    [containerView makeConstraints:^(MASConstraintMaker *make) {
          make.bottom.equalTo(label.mas_bottom).offset(20);// 这里放最后一个view的底部
    }];
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
