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
@property BOOL meterOnFlag;
@property (retain, nonatomic) AVAudioRecorder* recorder;

-(void)startMeter;
-(void)stopMeter;
-(IBAction)startButtonTapped:(id)sender;


@end
