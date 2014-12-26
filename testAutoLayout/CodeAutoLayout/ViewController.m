//
//  ViewController.m
//  CodeAutoLayout
//
//  Created by liyan on 12/23/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = UIScrollView.new;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.scrollView];
    
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
    
    [self.view  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)]];
    
    
    UIView *contextView = UIView.new;
    contextView.translatesAutoresizingMaskIntoConstraints = NO;
    contextView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:contextView];
    
    [_scrollView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contextView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contextView)]];
    
    [_scrollView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contextView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(contextView)]];
    
    [_scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contextView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    
    UIView *temp = nil;
    int height = 10;
    for (int i = 0; i < 50; i++)
    {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [contextView addSubview:view];

        [contextView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temp?temp:contextView attribute:temp?NSLayoutAttributeBottom:NSLayoutAttributeTop multiplier:1 constant:0]];
        
        [contextView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
        
        [contextView  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]" options:0 metrics:@{@"height":@(height)} views:NSDictionaryOfVariableBindings(view)]];
        
        temp = view;
        height = height*1.1;
    }
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contextView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:temp attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
