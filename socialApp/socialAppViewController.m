//
//  socialAppViewController.m
//  socialApp
//
//  Created by meng on 14-4-2.
//  Copyright (c) 2014年 meng. All rights reserved.
//

#import "socialAppViewController.h"

@interface socialAppViewController ()

@end

@implementation socialAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImage:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController: imagePicker animated:YES completion:nil];
        
    }
}

#pragma mark - 
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString*)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        _postImage.image = image;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    if ([_postText isFirstResponder] && [touch view] != _postText) {
        [_postText resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)sendPost:(id)sender {
    
    NSArray *activityItems;
    
    if (_postImage.image != nil) {
        activityItems = @[_postText.text, _postImage.image];
    }else{
        activityItems = @[_postText.text];
    }
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityController animated:YES completion:nil];
}
@end
