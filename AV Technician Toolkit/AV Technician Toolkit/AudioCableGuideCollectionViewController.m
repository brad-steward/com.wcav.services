//
//  AudioCableGuideCollectionViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 4/24/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "AudioCableGuideCollectionViewController.h"

@interface AudioCableGuideCollectionViewController (){
    NSArray *cablePhotos;
}

@end

@implementation AudioCableGuideCollectionViewController

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
    [super viewDidLoad];
    
    cablePhotos = [NSArray arrayWithObjects:@"miniaudio.jpg", "@quarterinch.jpg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return cablePhotos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *miniaudio = [collectionView dequeueReusableCellWithReuseIdentifier:@"miniaudio" forIndexPath:indexPath];
    
    UIImageView *miniaudioimageview = (UIImageView *)[miniaudio viewWithTag:1];
    miniaudioimageview.image = [UIImage imageNamed:[cablePhotos objectAtIndex:indexPath.row]];
    
    return miniaudio;
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
