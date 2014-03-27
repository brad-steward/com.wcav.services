//
//  DBMeterViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "DBMeterViewController.h"

@interface DBMeterViewController (){
    
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
    _meterOnFlag = NO;
    
    @try {
        //trying the same recording path as the audio recorder, we'll deal with deletion later...
        NSArray *pathComponents = [NSArray arrayWithObjects:
                                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                                   @"recording.m4a",
                                   nil];
        NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
        
        
        NSLog(@"Trying DBMeter");
        NSDictionary* recorderSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithInt:kAudioFormatMPEG4AAC],AVFormatIDKey,
                                          [NSNumber numberWithInt:44100],AVSampleRateKey,
                                          [NSNumber numberWithInt:1],AVNumberOfChannelsKey,
                                          [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                          [NSNumber numberWithBool:NO],AVLinearPCMIsBigEndianKey,
                                          [NSNumber numberWithBool:NO],AVLinearPCMIsFloatKey,
                                          nil];
        NSLog(@"Trying DBMeter later");
        //NSURL *temp = [NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingPathComponent:@"temp.m4a"]];
        NSLog(@"Trying DBMeter even later...");
        _recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL  settings:recorderSettings error:nil];
        NSLog(@"Trying DBMeter even more later...");
        _recorder.meteringEnabled = YES;
        NSLog(@"Trying DBMeter even more more later...");
        
        NSLog(@"Starting Thread...");
        _meter = [[NSThread alloc] initWithTarget:self selector:@selector(startMeter) object:nil];
    }
    @catch (NSException *exception) {
        NSLog(@"ERROR");
        NSLog([exception reason]);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startButtonTapped:(id)sender{
    if (_meterOnFlag == NO){
        [_startStop setTitle:@"Stop" forState:UIControlStateApplication];
        [_meter start];
        _meterOnFlag = YES;
    } else {
        [_meter cancel];
        [_startStop setTitle:@"Start" forState:UIControlStateApplication];
        _meterOnFlag = NO;
    }
    
}

//-(void)startThread{
    //[_meter detachNewThreadSelector:@selector(startMeter) toTarget:self withObject:nil];
//}

-(void)startMeter {
    //[self performSelectorOnMainThread:@selector(keepTheMeterRunning) withObject:nil waitUntilDone:YES];
}

-(void)keepTheMeterRunning {
    int i = 0;
    float decibels = 0;
    NSString *decString = @"";
    
    [_recorder record];
    
    do {
        [_recorder updateMeters];
        decibels = [_recorder averagePowerForChannel:0];
        decString = [[NSNumber numberWithFloat:decibels] stringValue];
        [_meterReading setText:decString];
        NSLog(@"update");
        i++;
        sleep(1);
    } while (true);

}

-(void)stopMeter {
    [_recorder stop];
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
