//
//  Post.m
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import "Post.h"

@implementation Post

@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
@dynamic liked;
@dynamic dateToFormat;
@dynamic createdAtString;



+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    newPost.liked = NO;
    newPost.userID = newPost.author.objectId;
    
    [newPost saveInBackgroundWithBlock: completion];
    
    
    
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
    //check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    
    if (!imageData) {
        return nil;
    } else {
        CGSize size = CGSizeMake(300.0, 300.0);
        image = [self resizeImage:image withSize:size];
    }
    imageData = UIImagePNGRepresentation(image);
    return [PFFileObject fileObjectWithName:@"image" data:imageData];
    
}

+ (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
