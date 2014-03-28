//
//  MagCameraViewController.h
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/20/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface MagCameraViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIImageView *viewFinder;

- (IBAction)selectPhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;


@end
