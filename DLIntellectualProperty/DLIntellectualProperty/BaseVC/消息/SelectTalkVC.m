//
//  SelectTalkVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/15.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "SelectTalkVC.h"
#import "TalkCollectionViewCell.h"
@interface SelectTalkVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak)IBOutlet UICollectionView *collectView;
@end

@implementation SelectTalkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择服务管家";
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    layout.itemSize = CGSizeMake((DLScreenWidth - 10 * 2 - 10 * 2) / 3, 120);
    _collectView.dataSource = self;
    _collectView.delegate = self;
    _collectView.collectionViewLayout = layout;
    //_collectView.backgroundColor = [UIColor colorNamed:@"grayBg"];
    [_collectView registerNib:[UINib nibWithNibName:@"TalkCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TalkCollectionViewCell"];
    
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
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *Arr = @[@"服务管家-斌斌",@"服务管家-王双",@"服务管家-佳佳",@"服务管家-小艾",@"服务管家-金鹏",@"服务管家-林淋",@"服务管家-杨洋",@"服务管家-阿飞",@"服务管家-冰冰",@"服务管家-微微",@"服务管家-木木",@"服务管家-双双"];
    
    TalkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TalkCollectionViewCell" forIndexPath:indexPath];
    NSString *imgName = [NSString stringWithFormat:@"图层 %ld",indexPath.row + 3];
//    cell.backgroundColor = [UIColor greenColor];
    cell.imgView.image = DLImage(imgName);
    cell.lab.text = Arr[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
