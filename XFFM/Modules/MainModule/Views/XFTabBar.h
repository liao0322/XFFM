//
//  XFTabBar.h
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFTabBar : UITabBar
/**
 点击中间按钮的执行代码块
 */
@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end
