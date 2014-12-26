//
//  ViewController.m
//  testAutoLayout
//
//  Created by liyan on 12/23/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewXIB;
@property (weak, nonatomic) IBOutlet UIView *contextXIB;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollViewXIB.translatesAutoresizingMaskIntoConstraints = NO;
    self.contextXIB.translatesAutoresizingMaskIntoConstraints    = NO;
    
    UIView *temp = nil;
    int height = 10;
    
    for (int i = 0; i < 50; i++)
    {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contextXIB addSubview:view];

        [self.contextXIB addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:temp?temp:_contextXIB attribute:temp?NSLayoutAttributeBottom:NSLayoutAttributeTop multiplier:1 constant:0]];

        [self.contextXIB  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
        
        [self.contextXIB  addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]" options:0 metrics:@{@"height":@(height)} views:NSDictionaryOfVariableBindings(view)]];
        
        temp = view;
        
        height = height * 1.1;
    }
    
    [self.scrollViewXIB addConstraint:[NSLayoutConstraint constraintWithItem:_contextXIB attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:temp attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
}

- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
