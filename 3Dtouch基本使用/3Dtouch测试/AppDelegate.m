//
//  AppDelegate.m
//  3Dtouch测试
//
//  Created by Ssuperjoy on 15/12/7.
//  Copyright © 2015年 Mr.Zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nav;
    
    // 拍照 UIApplicationShortcutIcon 设置icon
    UIApplicationShortcutIcon *iconCamera = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCapturePhoto];
    // UIMutableApplicationShortcutItem 设置标题和type（可以作为一种标识）
    UIMutableApplicationShortcutItem *itemCamera = [[UIMutableApplicationShortcutItem alloc] initWithType:@"camera" localizedTitle:@"拍照"];
    
    itemCamera.icon = iconCamera;
    
    // 相册
    UIApplicationShortcutIcon *iconPhotoLibrary = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
    UIMutableApplicationShortcutItem *itemPhotoLibrary = [[UIMutableApplicationShortcutItem alloc] initWithType:@"photoLibrary" localizedTitle:@"相册"];
    
    itemPhotoLibrary.icon = iconPhotoLibrary;
    
    // 设置自定义图片的icon
//    NSDictionary *userInfo1 = @{@"key":@"example"};
    UIApplicationShortcutIcon *exampleIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"imageName"];
    UIMutableApplicationShortcutItem *exampleItem = [[UIMutableApplicationShortcutItem alloc] initWithType:@"example" localizedTitle:@"大标题" localizedSubtitle:@"小标题" icon:exampleIcon userInfo:nil]; // 分大标题和小标题
    
    application.shortcutItems = @[itemCamera, itemPhotoLibrary, exampleItem];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


// 自己实现下面方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    // 根据type响应每个按钮的结果。
    if ([shortcutItem.type isEqualToString:@"camera"]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.window.rootViewController presentViewController:picker animated:YES completion:nil];
    }
    
    if ([shortcutItem.type isEqualToString:@"photoLibrary"]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self.window.rootViewController presentViewController:picker animated:YES completion:nil];
    }
    
    if ([shortcutItem.type isEqualToString:@"example"]) {
        NSLog(@"example");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
