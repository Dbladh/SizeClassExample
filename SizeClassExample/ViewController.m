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
@property (nonatomic, strong) NSArray *viewConstraints;

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
    
    [self updateViewConstraints];
}

- (void)updateViewConstraints {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_redView, _blueView);
    [self.view removeConstraints:self.viewConstraints];
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
        NSMutableArray *mutableConstraints = [NSMutableArray array];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redView]|" options:0 metrics:nil views:viewsDictionary]];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_blueView]|" options:0 metrics:nil views:viewsDictionary]];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redView][_blueView(_redView)]|" options:0 metrics:nil views:viewsDictionary]];
        self.viewConstraints = mutableConstraints;
    } else if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        NSMutableArray *mutableConstraints = [NSMutableArray array];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_redView]|" options:0 metrics:nil views:viewsDictionary]];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_blueView]|" options:0 metrics:nil views:viewsDictionary]];
        [mutableConstraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_redView][_blueView(_redView)]|" options:0 metrics:nil views:viewsDictionary]];
        self.viewConstraints = mutableConstraints;
    }
    [self.view addConstraints:self.viewConstraints];
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
