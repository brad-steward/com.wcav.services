//
//  ToneGenTableViewController.h
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ToneGenTableViewController : UITableViewController <AVAudioPlayerDelegate>



@property (retain, nonatomic) AVAudioPlayer *wPlayer;
@property (retain, nonatomic) AVAudioPlayer *pPlayer;
@property (retain, nonatomic) AVAudioPlayer *bPlayer;
@property (retain, nonatomic) AVAudioPlayer *blPlayer;
@property (retain, nonatomic) AVAudioPlayer *vPlayer;
@property (retain, nonatomic) AVAudioPlayer *gPlayer;

@property (weak, nonatomic) IBOutlet UIButton *wButton;
@property (weak, nonatomic) IBOutlet UIButton *pButton;
@property (weak, nonatomic) IBOutlet UIButton *bButton;
@property (weak, nonatomic) IBOutlet UIButton *blButton;
@property (weak, nonatomic) IBOutlet UIButton *vButton;
@property (weak, nonatomic) IBOutlet UIButton *gButton;



-(IBAction)wTapped:(id)sender;
-(IBAction)pTapped:(id)sender;
-(IBAction)bTapped:(id)sender;
-(IBAction)blTapped:(id)sender;
-(IBAction)vTapped:(id)sender;
-(IBAction)gTapped:(id)sender;

@end
