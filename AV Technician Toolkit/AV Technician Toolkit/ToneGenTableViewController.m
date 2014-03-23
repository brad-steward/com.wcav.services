//
//  ToneGenTableViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "ToneGenTableViewController.h"

@interface ToneGenTableViewController () {
}

@end

@implementation ToneGenTableViewController

@synthesize wButton = _wButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    @try {
        NSLog(@"Loading audio...");
        NSURL *wURL = [[NSBundle mainBundle] URLForResource:@"WhiteNoise_64kb" withExtension:@"mp3"];
        _wPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:wURL error:nil];
        //[_wPlayer play];
        _pPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:@"PinkNoise_64kb.mp3"] error:nil];
        _bPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:@"BrownianNoise_64kb.mp3"] error:nil];
        _blPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:@"audiocheck.net_bluenoise.wav"] error:nil];
        _vPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:@"audiocheck.net_violetnoise.wav"] error:nil];
        _gPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:@"audiocheck.net_greynoise.wav"] error:nil];
        NSLog([[_wPlayer url] path]);
        NSLog(@"...finished loading audio");
        //[self wTapped:_wButton];
        [self.tableView bringSubviewToFront:_wButton];
    } @catch (NSException *e){
        NSLog(@"Error loading audio file");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:@"cell"];
    }
    
    return cell;
}*/

-(IBAction)wTapped:(id)sender{
    NSLog(@"wTapped");
    [_wPlayer play];
    //wait((NSInteger *) 2000);
}

-(IBAction)pTapped:(id)sender{
    NSLog(@"pTapped");
    [_pPlayer play];
    wait((NSInteger *) 2000);
    [_pPlayer stop];
}

-(IBAction)bTapped:(id)sender{
    [_bPlayer play];
    wait((NSInteger *) 2000);
    [_bPlayer stop];
}

-(IBAction)blTapped:(id)sender{
    [_blPlayer play];
    wait((NSInteger *) 2000);
    [_blPlayer stop];
}

-(IBAction)vTapped:(id)sender{
    [_vPlayer play];
    wait((NSInteger *) 2000);
    [_vPlayer stop];
}

-(IBAction)gTapped:(id)sender{
    [_gPlayer play];
    wait((NSInteger *) 2000);
    [_gPlayer stop];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
