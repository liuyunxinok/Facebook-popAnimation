//
//  LSBasicAnimationViewController.m
//  popAnimationStudyDemo
//
//  Created by liuyunxin on 2017/10/26.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

#import "LSBasicAnimationViewController.h"

@interface LSBasicAnimationViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation LSBasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Moving" style:UIBarButtonItemStylePlain target:self action:@selector(movingAction)];
    
    [self startMovingView];
}

- (void)startMovingView{
    
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testView.backgroundColor = [UIColor redColor];
    self.testView.center = self.view.center;
    [self.view addSubview:self.testView];
}

- (void)movingAction{
    
    //动画
    NSInteger height = CGRectGetHeight(self.view.bounds);
    NSInteger width = CGRectGetWidth(self.view.bounds);
    
    CGFloat centerX = arc4random() % width;
    CGFloat centerY = arc4random() % height;
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 0.4;
    [self.testView pop_addAnimation:anim forKey:@"centerAnimation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
