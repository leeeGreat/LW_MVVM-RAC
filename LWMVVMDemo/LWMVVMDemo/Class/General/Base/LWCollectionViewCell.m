//
//  LWCollectionViewCell.m
//  YiDing
//

//

#import "LWCollectionViewCell.h"

@implementation LWCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self lw_setupViews];
    }
    return self;
}

- (void)lw_setupViews {}

@end
