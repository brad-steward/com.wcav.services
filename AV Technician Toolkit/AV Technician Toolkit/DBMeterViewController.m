//
//  DBMeterViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "DBMeterViewController.h"

@interface DBMeterViewController (){
    AVAudioRecorder* recorder;
}

@end

@implementation DBMeterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    @try {
        NSLog(@"Trying DBMeter");
        NSDictionary* recorderSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithInt:kAudioFormatAppleIMA4],AVFormatIDKey,
                                          [NSNumber numberWithInt:44100],AVSampleRateKey,
                                          [NSNumber numberWithInt:1],AVNumberOfChannelsKey,
                                          [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                          [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,
                                          [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,
                                          nil];
        NSError* error = nil;
        NSLog(@"Trying DBMeter later");
        recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.m4a"]]  settings:recorderSettings error:&error];
        recorder.meteringEnabled = YES;
        [recorder record];
        
        float decibels = 0;
        NSString *decString = @"";
        
        int i = 0;
        
        do {
            [recorder updateMeters];
            decibels = [recorder averagePowerForChannel:0];
            decString = [[NSNumber numberWithFloat:decibels] stringValue];
            [_meterReading setText:decString];
            NSLog(@"update");
            i++;
        } while (i < 100);

    }
    @catch (NSException *exception) {
        NSLog(@"ERROR");
    }
    @finally {
        [_meterReading setText:@"ERROR"];
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

@end
