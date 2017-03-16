//
//  LWTableViewHeaderFooterView.m

//

#import "LWTableViewHeaderFooterView.h"

@implementation LWTableViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self lw_setupViews];
    }
    return self;
}

- (void)lw_setupViews{}

@end
