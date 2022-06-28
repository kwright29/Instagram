//
//  NewPostViewController.m
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import "NewPostViewController.h"
#import "Post.h"

@interface NewPostViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *postImageView;
@property (strong, nonatomic) IBOutlet UITextField *postCaption;


@end

@implementation NewPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//    // TODO: Instantiate a UIImagePickerController
//    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
//    imagePickerVC.delegate = self;
//    imagePickerVC.allowsEditing = YES;
//    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
   
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // TODO: Do something with the images (based on your use case)
    self.postImageView.image = originalImage;
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapImageView:(id)sender {
    [self showImageOptions];
}


- (void)showCamera {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        [self cameraErrorAlert];
    }
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)showGallery {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}


- (void)showImageOptions {
  
        // TODO: create alert controller that alerts users when fields are empty
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Uploading Image"
                                                                                   message:@"Would you like to choose an image from your camera roll, or take a photo?"
                                                                            preferredStyle:(UIAlertControllerStyleAlert)];
        // create a cancel action
        UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"Take Photo"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle cancel response here. Doing nothing will dismiss the view.
            [self showCamera];
            
                                                          }];
        // add the cancel action to the alertController
        [alert addAction:takePhotoAction];

        // create an OK action
        UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:@"Upload From Gallery"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                                 // handle response here.
            [self showGallery];
                                                         }];
        // add the OK action to the alert controller
        [alert addAction:galleryAction];
        
        [self presentViewController:alert animated:YES completion:^{
            // optional code for what happens after the alert controller has finished presenting
        }];

}

- (void)cameraErrorAlert {
    // TODO: create alert controller that alerts users when fields are empty
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Camera Not Avaiable"
                                                                               message:@"Camera is not available. Please use your photo library instead."
                                                                        preferredStyle:(UIAlertControllerStyleAlert)];
//        // create a cancel action
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
//                                                            style:UIAlertActionStyleCancel
//                                                          handler:^(UIAlertAction * _Nonnull action) {
//                                                                 // handle cancel response here. Doing nothing will dismiss the view.
//                                                          }];
//        // add the cancel action to the alertController
//        [alert addAction:cancelAction];

    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                             // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:^{
        // optional code for what happens after the alert controller has finished presenting
    }];
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
