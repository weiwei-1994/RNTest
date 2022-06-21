//
//  ConfigPlugIn.h
//  RaactNativeTest
//
//  Created by shenWenFeng on 2022/6/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^PluginBlcok)(NSString * localHost,NSString * moduleName);

@interface ConfigPlugIn : UIViewController

@property (copy, nonatomic) PluginBlcok blcok;


@end

NS_ASSUME_NONNULL_END
