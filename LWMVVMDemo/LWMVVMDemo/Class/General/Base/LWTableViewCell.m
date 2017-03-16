//
//  LWTableViewCell.m
//  YiDing
//

//

#import "LWTableViewCell.h"

@implementation LWTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self lw_setupViews];
        [self lw_bindViewModel];
    }
    return self;
}

- (void)lw_setupViews{}

- (void)lw_bindViewModel{}

@end
