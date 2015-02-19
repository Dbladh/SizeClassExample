//
//  ViewController.m
//  SizeClassExample
//
//  Created by Ben Norris on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.redView];
    
    self.blueView = [UIView new];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.blueView];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_redView, _blueView);
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redView]|" options:0 metrics:nil views:viewsDictionary]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_blueView]|" options:0 metrics:nil views:viewsDictionary]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redView][_blueView(_redView)]|" options:0 metrics:nil views:viewsDictionary]];
    } else if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redView]|" options:0 metrics:nil views:viewsDictionary]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_blueView]|" options:0 metrics:nil views:viewsDictionary]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redView][_blueView(_redView)]|" options:0 metrics:nil views:viewsDictionary]];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
