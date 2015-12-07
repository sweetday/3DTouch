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
    
    // 检查是否支持压力感应，如果支持注册代理
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.btn];
    }
}

// 稍重点击的时候调用
- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.view.frame = self.view.frame;   // 记得设置frame
    return vc;
}

// 加重按调用
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}


@end
