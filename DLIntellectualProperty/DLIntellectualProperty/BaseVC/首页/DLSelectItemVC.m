//
//  DLSelectItemVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/14.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLSelectItemVC.h"
#import "ItemCollectionViewCell.h"
#import "DLQuestionListVC.h"
#import "EditPersonInfoVC.h"
@interface DLSelectItemVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak)IBOutlet UICollectionView *collectView;
@end

@implementation DLSelectItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.view.backgroundColor = [UIColor colorNamed:@"grayBg"];
    self.navigationItem.title = @"选择测试项目";
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.itemSize = CGSizeMake((DLScreenWidth - 10 - 17 * 2) / 3, 120);
//    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectView.dataSource = self;
    _collectView.delegate = self;
    _collectView.collectionViewLayout = layout;
    _collectView.backgroundColor = [UIColor colorNamed:@"grayBg"];
    [_collectView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCollectionViewCell"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-  (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *ArrA = @[@"高新技术",@"技术先进型",@"省级以上科技",@"科技企业孵化器",@"中青年科技创新",@"技术交易输出",@"科技企业入库",@"临床医学研究",@"农业科技示范"];
    NSArray *ArrB = @[@"企业政策推荐",@"服务企业政策推荐",@"创新平台政策推荐",@"众创空间政策推荐",@"人才支持政策推荐",@"补贴政策推荐",@"培育政策推荐",@"中心政策推荐",@"合作社政策推荐"];
    
    ItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCollectionViewCell" forIndexPath:indexPath];
    NSString * imgName = [NSString stringWithFormat:@"selectItem%ld",indexPath.row];
    cell.imgView.image = DLImage(imgName);
    cell.labA.text = ArrA[indexPath.row];
    cell.labB.text = ArrB[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
     EditPersonInfoVC *vc = [EditPersonInfoVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
