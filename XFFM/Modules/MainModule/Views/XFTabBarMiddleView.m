//
//  XFTabBarMiddleView.m
//  XFFM
//
//  Created by liaoxf on 2017/12/14.
//  Copyright © 2017年 liaoxf. All rights reserved.
//

#import "XFTabBarMiddleView.h"
#import "CALayer+PauseAimate.h"

@interface XFTabBarMiddleView ()
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation XFTabBarMiddleView

#pragma mark - Singleton

static XFTabBarMiddleView *sharedInstance = nil;
+ (instancetype)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [self middleView];
    }
    return sharedInstance;
}

+ (instancetype)middleView {
    XFTabBarMiddleView *middleView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    return middleView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.middleImageView.layer.masksToBounds = YES;
    self.middleImg = self.middleImageView.image;
    
    [self.middleImageView.layer removeAnimationForKey:@"playAnnimation"];
    CABasicAnimation *basicAnnimation = [[CABasicAnimation alloc] init];
    basicAnnimation.keyPath = @"transform.rotation.z";
    basicAnnimation.fromValue = @0;
    basicAnnimation.toValue = @(M_PI * 2);
    basicAnnimation.duration = 30;
    basicAnnimation.repeatCount = MAXFLOAT;
    basicAnnimation.removedOnCompletion = NO;
    [self.middleImageView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
    
    [self.middleImageView.layer pauseAnimate];
    
    // 监听播放状态的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:@"playState" object:nil];
    
    // 监听播放图片的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
}

- (void)isPlayerPlay:(NSNotification *)notification {
    BOOL isPlay = [notification.object boolValue];
    self.playing = isPlay;
}

- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImg = image;
}

- (IBAction)playButtonTouchUpInside:(UIButton *)sender {
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}

- (void)setPlaying:(BOOL)playing {
    if (self.playing == playing) {
        return;
    }
    self.playing = playing;
    if (playing) {
        [self.playButton setImage:nil forState:UIControlStateNormal];
        [self.middleImageView.layer resumeAnimate];
        
    }else {
        
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playButton setImage:image forState:UIControlStateNormal];
        [self.middleImageView.layer pauseAnimate];
    }
}


-(void)setMiddleImg:(UIImage *)middleImg {
    _middleImg = middleImg;
    self.middleImageView.image = middleImg;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.middleImageView.layer.cornerRadius = self.middleImageView.frame.size.width * 0.5;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
