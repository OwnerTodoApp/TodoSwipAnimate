//  ViewController.m
//  Created on 2018/10/17
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import "ViewController.h"
#import "ToDoAnimate.h"
#import "LineAnimated.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ToDoAnimate *checkbox = [[ToDoAnimate alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
    [self.view addSubview:checkbox];
    checkbox.ToDoAnimatedAnimProgress = 5;
    [checkbox addToDoAnimatedAnimation];
    
    LineAnimated *line = [[LineAnimated alloc] initWithFrame:CGRectMake(70, 225, 100, 10)];
    [self.view addSubview:line];
    line.ToDoAnimatedAnimProgress = 3;
    [line addToDoAnimatedAnimation];
}


@end
