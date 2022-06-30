//
//  InstaCell.h
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>
#import <Parse/ParseUIConstants.h>
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface InstaCell : UITableViewCell
@property (strong, nonatomic) IBOutlet PFImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *postCaption;
@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) IBOutlet UILabel *postUsername;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;

-(void)makePost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
