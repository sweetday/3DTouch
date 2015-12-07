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
    
    if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        [self registerForPreviewingWithDelegate:self sourceView:self.btn];
    }
}

- (UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.view.frame = self.view.frame;
    return vc;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}


@end
