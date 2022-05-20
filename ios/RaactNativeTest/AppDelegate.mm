#import "AppDelegate.h"
#import "HomeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  HomeController * home = [[HomeController alloc]init];
  UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:home];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = nav;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
