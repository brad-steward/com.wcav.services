//
//  DBMeterViewController.h
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DBMeterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel* meterReading;
@property (weak, nonatomic) IBOutlet UIButton* startStop;
@property BOOL meterOnFlag;
@property (retain, nonatomic) AVAudioRecorder* recorder;
@property (retain) NSThread* meter;

-(void)startMeter;
-(void)stopMeter;
-(IBAction)startButtonTapped:(id)sender;


@end
