//
//  DLLoginVC.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "DLLoginVC.h"
#import "LoginReq.h"
#import "VerifyCodeReq.h"
#import "LoginModel.h"
#import "RegistReq.h"
#import "SignInModel.h"
@interface DLLoginVC ()<UITextFieldDelegate>
@property (nonatomic, weak)IBOutlet UIButton *verifyCodeBtn;
@property (nonatomic, weak)IBOutlet DLBottomLineField *accountTextFeild;
@property (nonatomic, weak)IBOutlet DLBottomLineField *passwordTextFeild;
@property (nonatomic, weak)IBOutlet UIButton *loginBtn;
@property (nonatomic, strong)TTTAttributedLabel *agreeLab;
@property (nonatomic, strong)LoginModel *verityModel;
@property (nonatomic, strong)LoginModel *registModel;
@property (nonatomic, strong)SignInModel *signInModel;
@end

@implementation DLLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setUI];
    // Do any additional setup after loading the view from its nib.
}


- (void)setUI {
    WeakSelf(self);


    _accountTextFeild.tag = 1;
    _accountTextFeild.delegate = self;
    [_accountTextFeild addBottomLine];
    _passwordTextFeild.tag = 2;
    _passwordTextFeild.delegate = self;
    [_passwordTextFeild addBottomLine];
    NSDictionary *dic1 = @{NSForegroundColorAttributeName:DLRGB(102, 102, 102), NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _accountTextFeild.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:dic1];
    NSDictionary *dic2 = @{NSForegroundColorAttributeName:DLRGB(102, 102, 102), NSFontAttributeName:[UIFont systemFontOfSize:15]};
    _passwordTextFeild.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:dic2];
    _verifyCodeBtn.layer.borderWidth = 1;
    _verifyCodeBtn.layer.borderColor = DLRGB(255, 125, 95).CGColor;
    _verifyCodeBtn.layer.cornerRadius = 15;
    [_verifyCodeBtn setTitleColor:DLRGB(255, 125, 95) forState:UIControlStateNormal];
    [_verifyCodeBtn clickBtnBlock:^(UIButton * _Nonnull btn) {
        if (DLStringIsEmpty(self.accountTextFeild.text)) {
            NSSLog(@"手机号不能为空");
            [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];
            return;
        }
        if (self.accountTextFeild.text.length != 11) {
            NSSLog(@"手机号位数不正确");
            [SVProgressHUD showErrorWithStatus:@"手机号位数不正确"];
            return;
        }
        if (![self.accountTextFeild.text isValidateMobile]) {
            NSSLog(@"手机格式不符");
            [SVProgressHUD showErrorWithStatus:@"手机格式不符"];
            return;
        }
        [btn showCountDown:10 CountDwonText:@"重新获取%@s" AgainText:@"获取验证码"];
        //发送验证码
        [weakself requestForVerifyCode];
    }];
    _loginBtn.layer.borderColor = DLRGB(221, 221, 221).CGColor;
    _loginBtn.layer.borderWidth = 1;
    _loginBtn.layer.cornerRadius = 20;
    [_loginBtn clickBtnBlock:^(UIButton * _Nonnull btn) {
        NSSLog(@"点击按钮");
        if (DLStringIsEmpty(weakself.accountTextFeild.text)) {
            [SVProgressHUD showErrorWithStatus:@"手机号不能为空"];
            NSSLog(@"手机号不能为空");
            
            return;
        }
        if (weakself.accountTextFeild.text.length != 11) {
            [SVProgressHUD showErrorWithStatus:@"手机号位数不正确"];
            NSSLog(@"手机号位数不正确");
            return;
        }
        if (![weakself.accountTextFeild.text isValidateMobile]) {
            NSSLog(@"手机格式不符");
            [SVProgressHUD showErrorWithStatus:@"手机格式不符"];
            return;
        }
        if (DLStringIsEmpty(weakself.passwordTextFeild.text)) {
            NSSLog(@"验证码不能为空");
            [SVProgressHUD showErrorWithStatus:@"验证码不能为空"];
            return;
        }
        if (weakself.passwordTextFeild.text.length != 6) {
              [SVProgressHUD showErrorWithStatus:@"验证码位数不正确"];
            NSSLog(@"验证码位数不正确");
            return;
        }
        
        [weakself requestForRegist];
    }];
    
    _agreeLab = [TTTAttributedLabel new];
    _agreeLab.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:_agreeLab];
    _agreeLab.textAlignment = NSTextAlignmentCenter;
    NSString *text = @"注册代表同意《用户协议》";
    [_agreeLab setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
          NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"《用户协议》" options:NSCaseInsensitiveSearch];
          //设置可点击文本的颜色
          [mutableAttributedString addAttribute:(NSString*)kCTForegroundColorAttributeName value:(id)[DLRGB(255, 125, 95) CGColor] range:boldRange];
         return mutableAttributedString;
    }];
    [_agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(40);
        make.right.equalTo(-40);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(23);
        make.height.equalTo(11);
        
    }];
}

#pragma mark -UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *inputStr = [NSString stringWithFormat:@"%@%@",textField.text,string];
    if (textField.tag == 1) {
        if (inputStr.length > 11) {
            return NO;
        }
        if (![inputStr isValidateNumber]) {
            return NO;
        }
    } else if(textField.tag == 2) {
        if (inputStr.length > 6) {
            return NO;
        }
        if (![inputStr isValidateNumber]) {
            return NO;
        }
    }
    return YES;
}

-(void)requestForVerifyCode {
    WeakSelf(self);
    [SVProgressHUD show];
    VerifyCodeReq *req = [VerifyCodeReq new];
    req.phone = self.accountTextFeild.text;
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSDictionary *requestDict = [NSJSONSerialization JSONObjectWithData:request.responseObject options:NSJSONReadingMutableContainers error:nil];
        NSSLog(@"%@",requestDict);
        weakself.verityModel = [LoginModel modelWithDictionary:requestDict];
        if (weakself.verityModel.status == 0) {
            [[NSUserDefaults standardUserDefaults] setObject:weakself.verityModel.data.JSESSIONID forKey:@"JSESSIONID"];
             [SVProgressHUD dismiss];
        }else {
            [SVProgressHUD showErrorWithStatus:weakself.verityModel.msg];
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [SVProgressHUD showErrorWithStatus:request.error.description];
    }];
}

- (void)requestForLogin {
    WeakSelf(self);
    LoginReq *req = [LoginReq new];
    req.code = self.passwordTextFeild.text;
    req.mobile = self.accountTextFeild.text;
    [SVProgressHUD show];
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *requestDict = [NSJSONSerialization JSONObjectWithData:request.responseObject options:NSJSONReadingMutableContainers error:nil];
        NSSLog(@"%@",requestDict);
        weakself.signInModel = [SignInModel modelWithDictionary:requestDict];
   
        if (weakself.signInModel.status == 0) {
            [[NSUserDefaults standardUserDefaults] setObject:weakself.signInModel.data.JSESSIONID forKey:@"JSESSIONID"];
            [[NSUserDefaults standardUserDefaults] setObject:@(weakself.signInModel.data.id) forKey:@"id"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [SVProgressHUD dismiss];
            DLTabBarVC *tabbar = [DLTabBarVC new];
            [tabbar addChildVC:@"DLHomeVC" title:@"首页" normalImg:@"FirstN" selectImg:@"FirstS"];
            [tabbar addChildVC:@"DLMessageVC" title:@"消息" normalImg:@"SecN" selectImg:@"SecS"];
            [tabbar addChildVC:@"DLMineVC" title:@"我的" normalImg:@"ThirdN" selectImg:@"ThirdS"];
            self.mainWindow.rootViewController = tabbar;
        } else {
            [SVProgressHUD showErrorWithStatus:weakself.signInModel.msg];
        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [SVProgressHUD showErrorWithStatus:request.error.description];
    }];
    
    
}


- (void)requestForRegist {
     WeakSelf(self);
    RegistReq *req = [RegistReq new];
    req.code = self.passwordTextFeild.text;
    req.mobile = self.accountTextFeild.text;
    [SVProgressHUD show];
    [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *requestDict = [NSJSONSerialization JSONObjectWithData:request.responseObject options:NSJSONReadingMutableContainers error:nil];
        NSSLog(@"%@",requestDict);
        weakself.registModel = [LoginModel modelWithDictionary:requestDict];

        if (weakself.registModel.status == 0 || weakself.registModel.status == -2) {
            //0 注册成功 直接登陆
            if (weakself.registModel.status == 0) {
                [[NSUserDefaults standardUserDefaults] setObject:weakself.registModel.data.JSESSIONID forKey:@"JSESSIONID"];
                [[NSUserDefaults standardUserDefaults] setObject:@(weakself.registModel.data.id) forKey:@"id"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            
            [SVProgressHUD dismiss];
            [weakself requestForLogin];
        } else {
            [SVProgressHUD showErrorWithStatus:weakself.registModel.msg];
        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [SVProgressHUD showErrorWithStatus:request.error.description];
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
