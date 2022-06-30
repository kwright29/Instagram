//
//  PostCell.h
//  Instagram
//
//  Created by Khloe Wright on 6/30/22.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <Parse/ParseUIConstants.h>
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet PFImageView *cellImageView;

@end

NS_ASSUME_NONNULL_END
