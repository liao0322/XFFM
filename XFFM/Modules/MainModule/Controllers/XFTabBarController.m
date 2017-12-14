//
//  XFTabBarController.m
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import "XFTabBarController.h"
#import "XFTabBar.h"
#import "XFNavigationController.h"
#import "UIImage+XFExtension.h"


@interface XFTabBarController ()

@end

@implementation XFTabBarController

#pragma mark - Singleton

static XFTabBarController *sharedInstance = nil;
+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (id)copyWithZone:(NSZone *)zone {
    return sharedInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return sharedInstance;
}

#pragma mark - Custom

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(XFTabBarController *tabBarVC))addVCBlock {
    XFTabBarController *tabBarVC = [[XFTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabBarVC);
    }
    return tabBarVC;
}

- (void)addChildVC:(UIViewController *)vc title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    if (isRequired) {
        XFNavigationController *nav = [[XFNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage originalImageWithName:normalImageName] selectedImage:[UIImage originalImageWithName:selectedImageName]];
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)configurateTabBar {
    [self setValue:[[XFTabBar alloc] init] forKey:@"tabBar"];
}

@end
