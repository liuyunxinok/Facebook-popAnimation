//
//  ViewController.m
//  popAnimationStudyDemo
//
//  Created by liuyunxin on 2017/10/25.
//  Copyright © 2017年 liuyunxin. All rights reserved.
//

#import "ViewController.h"
#import "LSPopAnimationViewController.h"
#import "LSCountingViewController.h"
#import "LSBasicAnimationViewController.h"
#import "LSSpringAnimationViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *demoListTableView;
@property (nonatomic, strong) NSArray *demoNameList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Facebook-pop动画";
    _demoListTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _demoListTableView.rowHeight = 50;
    _demoListTableView.delegate = self;
    _demoListTableView.dataSource = self;
    [_demoListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:_demoListTableView];
    
    _demoNameList = @[@"动画菜单",@"计数器",@"POPBasicAnimation",@"PopSpringAnimation",@"PopDecayAnimation",@"POPCustomAnimation"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.demoNameList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.demoNameList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            LSPopAnimationViewController *popAnimationVC = [[LSPopAnimationViewController alloc] init];
            [self presentViewController:popAnimationVC animated:NO completion:nil];
        }
            break;
        case 1:
        {
            LSCountingViewController *countingDemoVC = [[LSCountingViewController alloc] init];
            countingDemoVC.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:countingDemoVC animated:YES];
        }
            break;
        case 2:
        {
            LSBasicAnimationViewController *popBasicAnimationVC = [[LSBasicAnimationViewController alloc] init];
            popBasicAnimationVC.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:popBasicAnimationVC animated:YES];
        }
            break;
        case 3:
        {
            LSSpringAnimationViewController *popSpringAnimationVC = [[LSSpringAnimationViewController alloc] init];
            popSpringAnimationVC.view.backgroundColor = [UIColor whiteColor];
            [self.navigationController pushViewController:popSpringAnimationVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
