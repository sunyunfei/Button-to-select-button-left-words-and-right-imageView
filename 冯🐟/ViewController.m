//
//  ViewController.m
//  冯🐟
//
//  Created by 孙云 on 16/3/29.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "ShowView.h"
#import "ShowTableView.h"
@interface ViewController ()
{

    ShowTableView *showTableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ShowView *showView = [[ShowView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40)];
    //按钮事件
    __block typeof(self)weakSelf = self;
    showView.chooseBtnBlock = ^(NSInteger index){
    
        if (showTableView == nil) {
            showTableView = [[ShowTableView alloc]initWithFrame:CGRectMake(0, showView.frame.origin.y + showView.frame.size.height, weakSelf.view.frame.size.width, 0)];
            [weakSelf.view addSubview:showTableView];
        }
        //参数穿过去
        [showTableView chooseIndex:index];
        //动画出现
        [UIView animateWithDuration:0.1 animations:^{
            CGRect rect = showTableView.frame;
            rect.size.height = weakSelf.view.frame.size.height - showView.frame.origin.y - showView.frame.size.height;
            showTableView.frame = rect;
        }];
    };
    showView.noChoooseBtnBlock =^{
    
       //动画消失
        [UIView animateWithDuration:0.1 animations:^{
            CGRect rect = showTableView.frame;
            rect.size.height = 0;
            showTableView.frame = rect;
        }];
    };
    [self.view addSubview:showView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
