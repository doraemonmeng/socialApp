//
//  socialAppViewController.h
//  socialApp
//
//  Created by meng on 14-4-2.
//  Copyright (c) 2014年 meng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface socialAppViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
- (IBAction)selectImage:(id)sender;
- (IBAction)sendPost:(id)sender;

@end
