//
//  ViewController.m
//  3Dtouch测试
//
//  Created by Ssuperjoy on 15/12/7.
//  Copyright © 2015年 Mr.Zhang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

// 初始化btn
- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

// 轻点button直接进入
- (void)btnClick
{
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.btn];
    
    [self.btn setTitle:@"点我啊" forState:UIControlStateNormal];
    
    // 检查是否支持压力感应，如果支持注册代理
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.btn];
    }
}

// 稍重点击的时候调用 peek
// previewingContext：预览内容   location：是按压的位置
- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    // 创建预览的控制器或者视图
    SecondViewController *vc = [[SecondViewController alloc] init];
    // 预览内容的区域，(0, 0)为默认区域
    vc.preferredContentSize = CGSizeMake(0, 0);
    // 轻点后在sourceRect范围外的区域变模糊（在这里不适用）
//    previewingContext.sourceRect = self.btn.frame;

    return vc;
}

// 加重按调用
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    // 在这里执行加重按后的代码
    [self showViewController:viewControllerToCommit sender:self];
}


@end
