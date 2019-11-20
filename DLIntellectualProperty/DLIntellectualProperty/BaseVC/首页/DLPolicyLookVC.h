//
//  DLPolicyLookVC.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/11.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLBaseVC.h"
#import "SSSearchBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface DLPolicyLookVC : DLBaseVC
@property (nonatomic, weak)IBOutlet UIButton *btn1;
@property (nonatomic, weak)IBOutlet UIButton *btn2;
@property (nonatomic, weak)IBOutlet UIButton *btn3;
@property (nonatomic, weak)IBOutlet UIButton *btn4;
@property (nonatomic, weak)IBOutlet UITableView *tableList;
@property (nonatomic, weak)IBOutlet SSSearchBar *searchBar;
@property (nonatomic, weak)IBOutlet UIView *searchTouchView;
@end

NS_ASSUME_NONNULL_END
