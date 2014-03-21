//
//  FlashlightViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/20/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "FlashlightViewController.h"
#import "AVFoundation/AVCaptureDevice.h"
#import "AVFoundation/AVMediaFormat.h"

@interface FlashlightViewController ()

@end

@implementation FlashlightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)flash:(UIButton *)sender {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    
    
    if ([[sender currentTitle] isEqualToString:@"Off"])
    {
        [device setTorchMode:AVCaptureTorchModeOn];
        [sender setTitle: (@"On") forState: UIControlStateNormal];
    } else {
        [device setTorchMode:AVCaptureTorchModeOff];
        [sender setTitle:@"Off" forState: UIControlStateNormal];
    }
}

/*- (IBAction)cancel:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
