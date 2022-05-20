//
//  RNNativeView.h
//  RaactNativeTest
//
//  Created by wyzeww on 2022/5/19.
//

#import <React/RCTViewManager.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNNativeViewManager : RCTViewManager

@end

@interface RNNativeView : UIView

@property(nonatomic,copy)NSString * labelText;

@property (nonatomic,copy) RCTBubblingEventBlock onClick;

@end

NS_ASSUME_NONNULL_END
