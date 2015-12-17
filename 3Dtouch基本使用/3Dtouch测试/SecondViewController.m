//
//  SecondViewController.m
//  3Dtouch测试
//
//  Created by Ssuperjoy on 15/12/7.
//  Copyright © 2015年 Mr.Zhang. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@end

@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    // 创建预览下面的按钮
//    self.previewActions = @[
//                            [UIPreviewAction actionWithTitle:@"请点击我" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
//                                NSLog(@"你点到我了");
//                            }]];

}

// 预览下面的按钮
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    return @[
             [UIPreviewAction actionWithTitle:@"请点击我" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                 NSLog(@"你点到我了");
             }]];
}


@end
