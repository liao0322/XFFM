//
//  UIImage+XFExtension.m
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import "UIImage+XFExtension.h"

@implementation UIImage (XFExtension)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)originalImageWithName:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
