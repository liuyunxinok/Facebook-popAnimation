//
//  LSCountingViewController.m
//  popAnimationStudyDemo
//
//  Created by liuyunxin on 2017/10/26.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

#import "LSCountingViewController.h"

@interface LSCountingViewController ()

@end

@implementation LSCountingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self startCounting];
}

- (void)startCounting
{
    UILabel *countingLable = [[UILabel alloc] initWithFrame:self.view.bounds];
    countingLable.textAlignment = NSTextAlignmentCenter;
    countingLable.font = [UIFont systemFontOfSize:60];
    [self.view addSubview:countingLable];
    
    //动画
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 10.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(id obj, CGFloat values[]) {
        values[0] = [[obj description] floatValue];};
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"%.2f",values[0]]];};
        prop.threshold = 0.01;
    }];
    anim.property = prop;
    anim.fromValue = @(0.0);
    anim.toValue = @(100.0);
    [countingLable pop_addAnimation:anim forKey:nil];
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
