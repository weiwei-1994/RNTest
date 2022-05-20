//
//  RNNativeView.m
//  RaactNativeTest
//
//  Created by wyzeww on 2022/5/19.
//

#import "RNNativeView.h"

@implementation RNNativeViewManager

//向js暴露view
RCT_EXPORT_MODULE(RNNativeView)

//向js暴露对外属性
RCT_EXPORT_VIEW_PROPERTY(labelText, NSString)
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTBubblingEventBlock)

-(UIView *)view{
  
  return [[RNNativeView alloc]init];
}

@end

@interface RNNativeView ()

@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UIButton * button;

@end

@implementation RNNativeView

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self loadSubViews];
  }
  return self;
}

-(void)loadSubViews{
  [self addSubview:self.label];
  [self addSubview:self.button];
}

-(UILabel *)label{
  if (_label == nil) {
    _label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 180, 40)];
    _label.backgroundColor = [UIColor blueColor];
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
  }
  return _label;
}

-(UIButton *)button{
  if (_button == nil) {
    _button = [UIButton buttonWithType:0];
    _button.frame = CGRectMake(10, 60, 100, 100);
    _button.backgroundColor = [UIColor greenColor];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button setTitle:@"原生按钮" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
  }
  return _button;
}

-(void)setLabelText:(NSString *)labelText{
  self.label.text = labelText;
}

-(void)setOnClick:(RCTBubblingEventBlock)onClick{
  _onClick = onClick;
}

-(void)buttonAction{
  self.onClick(@{@"responseKey":@"原生组件点击返回值"});
}

@end
