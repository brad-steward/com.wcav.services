//
//  TroubleGuideTableViewController.m
//  AV Technician Toolkit
//
//  Created by AV Programmer on 3/21/14.
//  Copyright (c) 2014 AV Services. All rights reserved.
//

#import "TroubleGuideTableViewController.h"

@interface TroubleGuideTableViewController ()

@end

@implementation TroubleGuideTableViewController

@synthesize importedRows = _importedRows;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    NSString *demoURL = @"file://localhost/Users/avprogrammer/com.wcav.services/AV Technician Toolkit/AV Technician Toolkit/demoCSV.csv";
    NSURL *temp = [NSURL URLWithString:demoURL];
    NSURL *url = temp;
    if (url != nil && [url isFileURL]) {
        [self handleOpenURL:url];
    }
    NSLog([url path]);
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSError *outError = nil;
    NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"demoCSV"  ofType:@"csv"];
    NSString *fileString = [NSString stringWithContentsOfFile:fullPath encoding:NSUTF8StringEncoding error:&outError];
    self.importedRows = [self csvArrayToRoomArray:[fileString csvParser]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.importedRows count];
}

-(void)handleOpenURL:(NSURL *)url {
    NSError *outError;
    NSString *fileString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&outError];
    
    if (fileString != nil) {
        self.importedRows = [self csvArrayToRoomArray:[fileString csvParser]];
    }
    
    NSLog(fileString);
    
    [self.tableView reloadData];
}

-(NSArray *) csvArrayToRoomArray:(NSArray *)csvArray {
    int i = 0;
    NSMutableArray *mutArr = [[NSMutableArray alloc] init];
    
    for (NSArray *row in csvArray) {
        if(i >= 0) {
            Room *_room = [[Room alloc] init];
            
            _room.roomNum = [row objectAtIndex:0];
            NSLog(_room.roomNum);
            _room.building = [row objectAtIndex:1];
            NSLog(_room.building);
            _room.type = [row objectAtIndex:2];
            NSLog(_room.type);
            
            [mutArr addObject:_room];
        }
        i++;
    }
    
    return (NSArray *) mutArr;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Room *r = (Room *)[self.importedRows objectAtIndex:indexPath.row];
    cell.textLabel.text = r.building, @" ", r.roomNum;
    
    return cell;
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
