//
//  ViewController.m
//  LifeCycle
//
//  Created by Ipageon_김태형 on 2021/10/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"뷰가 로드되었음");
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"뷰가 보여질 것임");
}
/*
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:<#animated#>];
    NSLog(@"뷰가 보여졌음");
}*/
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"뷰가 사라질 것임");
}
/*
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"뷰가 사라짐");
}*/


@end

