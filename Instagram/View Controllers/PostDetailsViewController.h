//
//  PostDetailsViewController.h
//  Instagram
//
//  Created by Khloe Wright on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>
#import <Parse/ParseUIConstants.h>
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *detailsUsername;
@property (strong, nonatomic) IBOutlet PFImageView *detailsImageView;
@property (strong, nonatomic) IBOutlet UILabel *detailsCaption;
@property (strong, nonatomic) IBOutlet UILabel *detailsTime;
@property (strong, nonatomic) Post *postDetails;

@end

NS_ASSUME_NONNULL_END
