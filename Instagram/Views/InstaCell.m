//
//  InstaCell.m
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import "InstaCell.h"
#import "UIImageView+AFNetworking.h"

@implementation InstaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)makePost:(Post *)post {
    self.post = post;
    self.postCaption.text = self.post.caption;
    NSString *username = [NSString stringWithFormat:@"@%@", self.post.author.username];
    self.postUsername.text = username;
    self.postImage.file = post[@"image"];
    [self.postImage loadInBackground];
    PFFileObject *userPic = post.author[@"profilePicture"];
    [self.profilePicture setImageWithURL:[NSURL URLWithString:userPic.url]];
}
- (IBAction)didTapLike:(id)sender {
   
}

@end
