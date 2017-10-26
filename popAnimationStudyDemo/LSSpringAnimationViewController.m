//
//  LSSpringAnimationViewController.m
//  popAnimationStudyDemo
//
//  Created by liuyunxin on 2017/10/26.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

#import "LSSpringAnimationViewController.h"

@interface LSSpringAnimationViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation LSSpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Moving" style:UIBarButtonItemStylePlain target:self action:@selector(movingAction)];
    
    [self addPopAnimationView];
}

- (void)addPopAnimationView
{
    _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _testView.center = self.view.center;
    _testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testView];
}


- (void)movingAction
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    NSInteger height = CGRectGetHeight(self.view.bounds);
    NSInteger width = CGRectGetWidth(self.view.bounds);
    
    CGFloat centerX = arc4random() % width;
    CGFloat centerY = arc4random() % height;
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.springBounciness = 16;
    anim.springSpeed = 6;
    [self.testView pop_addAnimation:anim forKey:@"center"];
    
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
