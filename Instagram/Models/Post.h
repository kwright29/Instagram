//
//  Post.h
//  Instagram
//
//  Created by Khloe Wright on 6/28/22.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Post : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic) BOOL liked;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic, strong) NSDate *dateToFormat;
@property (nonatomic, strong) NSString *createdAtString;

+ (void) postUserImage: ( UIImage * _Nullable)image withCaption: (NSString * _Nullable)caption withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END

/*
 
 NSString *createdAtOriginalString = dictionary[@"created_at"];
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
 // Configure the input format to parse the date string
 formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
 // Convert String to Date
 NSDate *date = [formatter dateFromString:createdAtOriginalString];
 self.dateToFormat = date;
 // Configure output format
 formatter.dateStyle = NSDateFormatterShortStyle;
 formatter.timeStyle = NSDateFormatterNoStyle;
 // Convert Date to String
 self.createdAtString = [formatter stringFromDate:date];
 */
