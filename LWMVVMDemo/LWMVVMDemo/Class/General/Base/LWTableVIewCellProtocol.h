//
//  YDTableVIewCellProtocol.h

//

#import <Foundation/Foundation.h>

@protocol LWTableVIewCellProtocol <NSObject>
@optional

- (void)lw_setupViews;
- (void)lw_bindViewModel;

@end
