//
//  LSPopAnimationViewController.m
//  popTest1
//
//  Created by liuyunxin on 2017/10/24.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

#import "LSPopAnimationViewController.h"
#import "LSPopAnimationButton.h"

@interface LSPopAnimationViewController ()

@property (nonatomic, strong) NSArray *buttonImages;
@property (nonatomic, strong) NSArray *buttonTitles;

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIImageView *tipImageView;

@property (nonatomic, strong) NSArray *times;

@end

@implementation LSPopAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initViewControllerFirstData];
    
    [self loadData];
    
    [self startButtonAnimation];
    
    [self startTipImageViewAnimation];
}

- (void)initViewControllerFirstData
{
    self.buttons = [NSMutableArray array];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"shareBottomBackground"];
    [self.view addSubview:bgImageView];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"shareButtonCancel"] forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"shareButtonCancelClick"] forState:UIControlStateHighlighted];
    [cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.frame = CGRectMake((SCREEN_W - cancelButton.currentBackgroundImage.size.width) / 2 , SCREEN_H - cancelButton.currentBackgroundImage.size.height - 20, 0, 0);
    [cancelButton sizeToFit];
    [self.view addSubview:cancelButton];
}

- (void)loadData
{
    self.buttonImages = @[@"publish-audio",@"publish-offline",@"publish-picture",@"publish-review",@"publish-text",@"publish-video"];
    self.buttonTitles = @[@"发语音",@"离线下载",@"发图片",@"审帖",@"发段子",@"发视频"];
}

- (void)startButtonAnimation
{
    
    for (NSInteger i = 0 ; i < self.buttonImages.count ; i++) {
        CGFloat buttonW = SCREEN_W / 3;
        CGFloat buttonX = i % 3 * buttonW;
        CGFloat buttonY = 200 + i / 3 * buttonW;
        LSPopAnimationButton *button = [LSPopAnimationButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:self.buttonImages[i]] forState:UIControlStateNormal];
        [button setTitle:self.buttonTitles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:button];
        [self.buttons addObject:button];
        // 动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY - SCREEN_H, buttonW, buttonW)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonW)];
        anim.springSpeed = 10;
        anim.springBounciness = 10;
        // CACurrentMediaTime()获得的是当前时间
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [button pop_addAnimation:anim forKey:nil];
    }
    
}

- (void)startTipImageViewAnimation
{
    
    _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    CGFloat imageX = (SCREEN_W - _tipImageView.image.size.width) / 2;
    CGFloat imageY = 160 - _tipImageView.image.size.height;
    CGFloat imageW = _tipImageView.image.size.width;
    CGFloat imageH = _tipImageView.image.size.height;
    _tipImageView.y = imageY - SCREEN_H;
    [self.view addSubview:_tipImageView];
    
    // 动画
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    anim.fromValue = [NSValue valueWithCGRect:CGRectMake(imageX, imageY - SCREEN_H, imageW, imageH)];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(imageX, imageY, imageW, imageH)];
    anim.springSpeed = 10;
    anim.springBounciness = 10;
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [_tipImageView pop_addAnimation:anim forKey:nil];
}

- (void)cancelAction:(UIButton *)sender
{
    sender.hidden = YES;
    
    // 让按钮执行动画
    for (int i = 0; i < self.buttons.count; i++) {
        LSPopAnimationButton *button = self.buttons[i];
        
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim.toValue = @(button.layer.position.y + SCREEN_H);
        // CACurrentMediaTime()获得的是当前时间
        anim.beginTime = CACurrentMediaTime() + [self.times[i] doubleValue];
        [button.layer pop_addAnimation:anim forKey:nil];
    }
    
    // 让标题执行动画
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(self.tipImageView.layer.position.y + SCREEN_H);
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.tipImageView.layer pop_addAnimation:anim forKey:nil];
}

- (NSArray *)times
{
    if (!_times) {
        CGFloat interval = 0.1; // 时间间隔
        _times = @[@(5 * interval),
                   @(4 * interval),
                   @(3 * interval),
                   @(2 * interval),
                   @(0 * interval),
                   @(1 * interval),
                   @(6 * interval)]; // 标语的动画时间
    }
    return _times;
}

@end
