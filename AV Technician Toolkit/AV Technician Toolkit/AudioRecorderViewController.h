//
//  AudioRecorderViewController.h
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/20/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioRecorderViewController : UIViewController <AVAudioRecorderDelegate, AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton* recordPauseButton;
@property (weak, nonatomic) IBOutlet UIButton* stopButton;
@property (weak, nonatomic) IBOutlet UIButton* playButton;

-(IBAction)recordPauseTapped:(id)sender;
-(IBAction)stopTapped:(id)sender;
-(IBAction)playTapped:(id)sender;

@end
