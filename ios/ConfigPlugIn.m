//
//  ConfigPlugIn.m
//  RaactNativeTest
//
//  Created by shenWenFeng on 2022/6/20.
//

#import "ConfigPlugIn.h"

@interface ConfigPlugIn ()<UITextFieldDelegate>

@property(nonatomic,strong)NSString * localHost;
@property(nonatomic,strong)NSString * moduleName;
@end

@implementation ConfigPlugIn

- (void)viewDidLoad {
  [super viewDidLoad];
  [self creatUI];
}

-(void)creatUI{
  self.view.backgroundColor = [UIColor whiteColor];
  UILabel * IPLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
  IPLB.text = @"电脑IP";
  IPLB.textColor = [UIColor blackColor];
  [self.view addSubview:IPLB];
  
  UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(IPLB.frame), IPLB.frame.origin.y, 200, 50)];
  field.placeholder = @"请输入电脑IP地址";
  field.textColor = [UIColor blackColor];
  field.delegate = self;
  //默认WF的IP
  field.text = @"192.168.68.107";
  self.localHost = field.text;
  field.tag = 0;
  [self.view addSubview:field];
  
  
  UILabel * nameLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 100, 50)];
  nameLB.text = @"插件名";
  nameLB.textColor = [UIColor blackColor];
  [self.view addSubview:nameLB];
  
  UITextField * field1 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLB.frame), nameLB.frame.origin.y, 200, 50)];
  field1.placeholder = @"请输入插件名";
  field1.textColor = [UIColor blackColor];
  field1.delegate = self;
  field1.tag = 1;
  [self.view addSubview:field1];
  
  
  
  UIButton * OKBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(nameLB.frame), 100, 50)];
  OKBtn.backgroundColor= [UIColor greenColor];
  
  [OKBtn addTarget:self action:@selector(clickOKBtn) forControlEvents:UIControlEventTouchUpInside];
  [OKBtn setTitle:@"确定" forState:UIControlStateNormal];
  [self.view addSubview:OKBtn];
  
  
}

- (void)textFieldDidChangeSelection:(UITextField *)textField{
  if (textField.tag == 0) {
    self.localHost = textField.text;
  }else{
    self.moduleName = textField.text;
  }
}



-(void)clickOKBtn{
  
  if (self.blcok && self.localHost && self.moduleName) {
    self.blcok(self.localHost, self.moduleName);
    [self.navigationController popViewControllerAnimated:YES];
  }
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
