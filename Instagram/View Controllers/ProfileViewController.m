//
//  ProfileViewController.m
//  Instagram
//
//  Created by Khloe Wright on 6/30/22.
//

#import "ProfileViewController.h"
#import "Post.h"

@interface ProfileViewController ()  <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *postCollectionView;
@property (strong, nonatomic) IBOutlet UIImageView *userProfilePicture;
@property (strong, nonatomic) IBOutlet UILabel *userUsername;
@property (strong, nonatomic) NSMutableArray *userPosts;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postCollectionView.dataSource = self;
    self.postCollectionView.delegate = self;
    // Do any additional setup after loading the view.
    self.userUsername.text = PFUser.currentUser.username;
    PFFileObject *userPic = PFUser.currentUser[@"profilePicture"];
    [userPic getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
        self.userProfilePicture.image = [UIImage imageWithData:data];
    }];
    //self.userProfilePicture =
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (void)getUserPosts {
//
//}
//- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//
//}
//
//- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    
//}



@end
