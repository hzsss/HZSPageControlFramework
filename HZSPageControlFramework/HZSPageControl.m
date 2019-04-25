//
//  HZSPageControl.m
//  PageControl
//
//  Created by Acan on 2019/4/24.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "HZSPageControl.h"

@interface HZSPageDot : UIView
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
@end

@implementation HZSPageDot

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    self.backgroundColor = selected ? self.currentPageIndicatorTintColor : self.pageIndicatorTintColor;
    _selected = selected;
}

@end

@interface HZSPageControl()
@property (nonatomic, strong) NSMutableArray *dots;
@property (nonatomic, strong) HZSPageDot *preDot;
@end

@implementation HZSPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dots = [NSMutableArray array];
        self.pageIndicatorTintColor = [UIColor colorWithWhite:1.0 alpha:0.6];
        self.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat gap = (width - 6 * (self.numberOfPages - 1) - 16) / (self.numberOfPages - 1);
    
    for (NSInteger i=0; i<self.numberOfPages; i++) {
        HZSPageDot *dot = (HZSPageDot *)self.dots[i];
        CGFloat dotWidth = dot.selected ? 16 : 6;
        
        HZSPageDot *tmpDot = nil;
        CGFloat x = 0;
        if (i != 0) {
            tmpDot = (HZSPageDot *)self.dots[i - 1];
            x = CGRectGetMaxX(tmpDot.frame) + gap;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            dot.frame = CGRectMake(x, 0, dotWidth, 6);
        }];
        
    }
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    for (NSInteger i=0; i<numberOfPages; i++) {
        HZSPageDot *dot = [[HZSPageDot alloc] init];
        dot.pageIndicatorTintColor = self.pageIndicatorTintColor;
        dot.currentPageIndicatorTintColor = self.currentPageIndicatorTintColor;
        dot.selected = i == 0 ? YES : NO;
        [self.dots addObject:dot];
        [self addSubview:dot];
    }
    if (numberOfPages > 0) self.preDot = self.dots[0];
    [self layoutIfNeeded];
    _numberOfPages = numberOfPages;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    self.preDot.selected = NO;
    HZSPageDot *dot = self.dots[currentPage];
    self.preDot = dot;
    dot.selected = YES;
    [self setNeedsLayout];
    _currentPage = currentPage;
}

@end