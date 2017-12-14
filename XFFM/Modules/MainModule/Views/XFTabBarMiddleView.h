//
//  XFTabBarMiddleView.h
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFTabBarMiddleView : UIView

+ (instancetype)sharedInstance;

/**
 控制是否正在播放
 */
@property (nonatomic, assign, getter=isPlaying) BOOL playing;

/**
 中间图片
 */
@property (nonatomic, strong) UIImage *middleImg;

/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end
