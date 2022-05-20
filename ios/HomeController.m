//
//  HomeController.m
//  RaactNativeTest
//
//  Created by wyzeww on 2022/5/18.
//

#import "HomeController.h"
#import "ReactNativeController.h"
#import <React/RCTRootView.h>
#import <AFNetworking/AFNetworking.h>
@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray * dataSource;
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"APP首页";
    self.dataSource = @[@"打开插件"];
    [self.view addSubview:self.tableView];
  
    // Do any additional setup after loading the view.
}

-(UITableView *)tableView{
  if (_tableView == nil) {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
  }
  return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
      cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
  cell.textLabel.text = self.dataSource[indexPath.row];
  return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  NSString * operation = self.dataSource[indexPath.row];
  
  if ([operation isEqualToString:@"下载插件包"]) {
    [self downloadPluginWithPluginId:@"12345"];
  }else{
    [self openPlugin];
  }
  
}

-(void)openPlugin{
  
  ReactNativeController * reactNavtiveVC = [[ReactNativeController alloc]init];
  
  NSURL *jsCodeLocation;
  
  #if DEBUG
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
  #else
    jsCodeLocation = [NSURL URLWithString:[self getPluginPathWithPluginId:@"12345"]];
  #endif
//RNDemo RNHighScores
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                   moduleName: @"RNHighScores"
                            initialProperties: nil
                                launchOptions: nil];
  reactNavtiveVC.view = rootView;
  [self.navigationController pushViewController:reactNavtiveVC animated:YES];
}

-(void)downloadPluginWithPluginId:(NSString *)pluginId{
  if (![self isExistsAtPath:[self getPluginsPath]]) {
    [self createDirectoryAtPath:[self getPluginsPath] error:nil];
  }
  
  if ([self isExistsAtPath:[self getPluginPathWithPluginId:pluginId]]) {
    [self removeItemAtPath:[self getPluginPathWithPluginId:pluginId] error:nil];
  }
  
  [self downLoadPlugin:pluginId];
}

- (NSString *)documentsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (BOOL)isExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

- (BOOL)createDirectoryAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    NSFileManager *manager = [NSFileManager defaultManager];
    /* createDirectoryAtPath:withIntermediateDirectories:attributes:error:
     * 参数1：创建的文件夹的路径
     * 参数2：是否创建媒介的布尔值，一般为YES
     * 参数3: 属性，没有就置为nil
     * 参数4: 错误信息
    */
    BOOL isSuccess = [manager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:error];
    return isSuccess;
}

- (BOOL)removeItemAtPath:(NSString *)path error:(NSError *__autoreleasing *)error {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:error];
}

-(void)downLoadPlugin:(NSString *)pluginId{
    //下载插件包
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:@"https://venus-redis-backup.s3.us-west-2.amazonaws.com/index.bundle"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString * path = [self getPluginPathWithPluginId:pluginId];
        NSURL *url = [NSURL fileURLWithPath:path];
        return url;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
    }];
    [downloadTask resume];
}

-(NSString *)getPluginsPath{
    return [NSString stringWithFormat:@"%@/%@",[self documentsDir],@"Plugins"];
}

-(NSString *)getPluginPathWithPluginId:(NSString *)pluginId{
    return [[self getPluginsPath]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/index.bundle",pluginId]];
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
