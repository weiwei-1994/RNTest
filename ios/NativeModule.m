//
//  NativeModule.m
//  RaactNativeTest
//
//  Created by wyzeww on 2022/5/19.
//

#import "NativeModule.h"

@implementation NativeModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)param1 parma2:(NSString *)param2 callback:(RCTResponseSenderBlock)callback)
{
  NSString * response = [NSString stringWithFormat:@"传入参数：%@----%@",param1,param2];
  callback(@[response]);
}

RCT_EXPORT_METHOD(nativeStackPop){
  dispatch_async(dispatch_get_main_queue(), ^{
    UINavigationController * nav = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    [nav popViewControllerAnimated:YES];
  });
}

@end
