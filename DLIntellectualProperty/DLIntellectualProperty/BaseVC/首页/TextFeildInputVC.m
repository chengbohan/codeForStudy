//
//  TextFeildInputVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/15.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "TextFeildInputVC.h"

@interface TextFeildInputVC ()
@property(nonatomic, weak)IBOutlet UITextField *field;
@end

@implementation TextFeildInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _plaholder;
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUI {
    _field.placeholder = _plaholder;
    
    
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
