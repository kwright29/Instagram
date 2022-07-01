//
//  PostDetailsViewController.m
//  Instagram
//
//  Created by Khloe Wright on 6/30/22.
//

#import "PostDetailsViewController.h"
#import "TimelineViewController.h"
#import "DateTools.h"

@interface PostDetailsViewController ()

@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *username = [NSString stringWithFormat:@"@%@", _postDetails.author.username];
    _detailsUsername.text = username;
    
    NSString *caption = [NSString stringWithFormat:@"%@: %@", username, _postDetails.caption];
    _detailsCaption.text = caption;
    NSString *shortDate = [_postDetails.createdAt shortTimeAgoSinceNow];
    _detailsTime.text = [NSString stringWithFormat:@"%@ ago", shortDate];
    //_detailsTime.text = [[TimelineViewController new] formatDate:_postDetails.createdAt];
    _detailsImageView.file = _postDetails.image;
    [_detailsImageView loadInBackground];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
