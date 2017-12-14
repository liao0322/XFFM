//
//  XFTabBarController.h
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFTabBarController : UITabBarController

/**
 获取单例对象

 @return XFTabBarController对象
 */
+ (instancetype)sharedInstance;


/**
 添加子控制器的block

 @param addVCBlock 添加代码块
 @return XFTabBarController对象
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(XFTabBarController *tabBarVC))addVCBlock;


/**
 添加子控制器

 @param vc 子控制器
 @param title 标题
 @param normalImageName 普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired 是否需要包装导航控制器
 */
- (void)addChildVC:(UIViewController *)vc title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;

@end
