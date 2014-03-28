//
//  MagCameraViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/20/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "MagCameraViewController.h"

@interface MagCameraViewController (CameraDelegateMethods)

@end

@implementation MagCameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    [self launchCameraControllerFromViewController:self usingDelegate:self];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:@"device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)launchCameraControllerFromViewController:(UIViewController*) controller usingDelegate: (id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate {
    
    BOOL truefalse = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (!truefalse || (delegate == nil) || (controller == nil)){
        NSLog(@"no can do, delegate/camera/view controller doesn't exist!");
        return NO;
    }
    
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
    
    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
    cameraController.allowsEditing = NO;
    cameraController.delegate = delegate;
    
    [controller presentModalViewController:cameraController animated:YES];
    
    return YES;
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerController: (UIImagePickerController*) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.viewFinder.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)selectPhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)takePhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
@end
