//
//  TroubleGuideTableViewController.h
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"
#import "NSString+ParsingExt.h"

@interface TroubleGuideTableViewController : UITableViewController

-(void) handleOpenURL:(NSURL *)url;

@property (nonatomic, retain) NSArray *importedRows;

@end
