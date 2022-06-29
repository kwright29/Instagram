//
//  TimelineViewController.m
//  Instagram
//
//  Created by Khloe Wright on 6/27/22.
//

#import "TimelineViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"
#import "SceneDelegate.h"
#import "InstaCell.h"
#import "Post.h"
#import "PostDelegate.h"
#import "NewPostViewController.h"

@interface TimelineViewController () <UITableViewDataSource, PostDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *posts;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.posts = [[NSMutableArray alloc]init];
    self.tableView.dataSource = self;
    [self retrievePosts];
    // Do any additional setup after loading the view.
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"postSegue"]) {
        NewPostViewController *postVC = [segue destinationViewController];
        postVC.delegate = self;
    }
}
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
//    // Create NSURL and NSURLRequest
//
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
//                                                          delegate:nil
//                                                     delegateQueue:[NSOperationQueue mainQueue]];
//    session.configuration.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//
//       // ... Use the new data to update the data source ...
//
//       // Reload the tableView now that there is new data
//        [self.tableView reloadData];
//
//       // Tell the refreshControl to stop spinning
//        [refreshControl endRefreshing];
//
//    }];
    [self retrievePosts];
    //[task resume];
}

- (void)retrievePosts {
    //construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    //fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.posts = (NSMutableArray *)posts;
            [self.tableView reloadData];
        }
        else {
            // handle error
            NSLog(@"Problem retrieving posts: %@", error.localizedDescription);
        }
    }];
    
}
- (IBAction)didTapLogout:(id)sender {
    SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    sceneDelegate.window.rootViewController = loginVC;

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InstaCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"InstaCell" forIndexPath:indexPath];
    
    Post *post = self.posts[indexPath.row];
    cell.post = post;
    [cell makePost:post];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)didSharePost {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self retrievePosts];
    [self.tableView reloadData];
}

@end
