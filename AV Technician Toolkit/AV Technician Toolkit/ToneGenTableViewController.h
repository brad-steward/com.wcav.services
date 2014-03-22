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

@property (strong, nonatomic) IBOutlet UITableView *noiseTable;
@property (weak, nonatomic) IBOutlet UITableViewCell *pNoiseSelector;
@property (weak, nonatomic) IBOutlet UITableViewCell *bNoiseSelector;
@property (weak, nonatomic) IBOutlet UITableViewCell *blNoiseSelector;
@property (weak, nonatomic) IBOutlet UITableViewCell *vNoiseSelector;
@property (weak, nonatomic) IBOutlet UITableViewCell *gNoiseSelector;
@property (weak, nonatomic) IBOutlet UITableViewCell *wNoiseSelector;


@end
