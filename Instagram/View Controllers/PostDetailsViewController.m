//
//  PostDetailsViewController.m
//  Instagram
//
//  Created by Khloe Wright on 6/30/22.
//

#import "PostDetailsViewController.h"

@interface PostDetailsViewController ()

@end

@implementation PostDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *username = [NSString stringWithFormat:@"@%@", _postDetails.author.username];
    _detailsUsername.text = username;
    
    NSString *caption = [username stringByAppendingString:_postDetails.caption];
    _detailsCaption.text = caption;
    
   
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
