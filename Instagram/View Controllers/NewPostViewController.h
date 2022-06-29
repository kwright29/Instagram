//
//  NewPostViewController.h
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "PostDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewPostViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, weak) id <PostDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
