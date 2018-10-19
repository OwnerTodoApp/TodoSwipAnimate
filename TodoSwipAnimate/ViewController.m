//  ViewController.m
//  Created on 2018/10/17
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import "ViewController.h"
#import "ToDoAnimate.h"
#import "LineAnimated.h"
@interface ViewController ()
@property(nonatomic, strong) ToDoAnimate *checkbox;
@property(nonatomic, strong) LineAnimated *line;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ToDoAnimate *checkbox = [[ToDoAnimate alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
//    [self.view addSubview:checkbox];
//    checkbox.ToDoAnimatedAnimProgress = 5;
//    [checkbox addToDoAnimatedAnimation];
//    
//    LineAnimated *line = [[LineAnimated alloc] initWithFrame:CGRectMake(70, 220, 200, 10)];
//    [self.view addSubview:line];
//    line.ToDoAnimatedAnimProgress = 3;
//    [line addToDoAnimatedAnimation];
}


- (IBAction)animated:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.line removeFromSuperview];
    [self.checkbox removeFromSuperview];
    if (sender.selected) {
        self.checkbox = [[ToDoAnimate alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
        [self.view addSubview:self.checkbox];
        [self.checkbox addToDoAnimatedAnimation];
        
        self.line = [[LineAnimated alloc] initWithFrame:CGRectMake(70, 220, 200, 10)];
        [self.view addSubview:self.line];
        [self.line addToDoAnimatedAnimation];
    }else{
        self.checkbox = [[ToDoAnimate alloc] initWithFrame:CGRectMake(20, 200, 50, 50)];
        [self.view addSubview:self.checkbox];
        [self.checkbox addToDoDismissAnimatedAnimation];
        
        self.line = [[LineAnimated alloc] initWithFrame:CGRectMake(70, 220, 200, 10)];
        [self.view addSubview:self.line];
        [self.line addToDoDismissAnimatedAnimation];
    }
    
}

@end
