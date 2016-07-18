//
//  ViewController.m
//  Quartz-2D
//
//  Created by cxwl on 16/5/24.
//  Copyright © 2016年 cxwl. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MyView *myView = [[MyView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 400)];
    myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
