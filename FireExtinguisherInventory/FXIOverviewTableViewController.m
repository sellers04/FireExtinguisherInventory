//
//  FXIOverviewTableViewController.m
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import "FXIOverviewTableViewController.h"
#import "FXIExtinguisherViewController.h"
#import "FXIFireExtinguisher.h"


@interface FXIOverviewTableViewController ()

@property (strong, nonatomic) NSMutableArray *fireExtItems;

@end

@implementation FXIOverviewTableViewController


- (NSMutableArray *) fireExtItems
{
    if (!_fireExtItems)
    {
        _fireExtItems = [[NSMutableArray alloc] init];
    }
    
    return _fireExtItems;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadInitialData];
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadInitialData
{
    int maxRows = 10;
    for(int i = 0; i < maxRows; i++)
    {
        FXIFireExtinguisher *newItem = [[FXIFireExtinguisher alloc] init];
        newItem.name = @"AdamsHallA";
        newItem.idValue = @2194;
        
        FXILocation *newLocation = [[FXILocation alloc] init];
        newLocation.building = @"Adams Hall";
        newLocation.floor = @1;
        newLocation.section = @"North";
        newLocation.room = @0;
        newItem.location = newLocation;
        
        newItem.serviceEvents = [self getServiceEvents];
        
        [newItem.note setString:@"I am an extinguisher"];
        
        newItem.model = @"FireTech9000";
        newItem.yearMade = @2033;
        
        [newItem.inspectionInterval setString:@"3 months"];
        
        newItem.size = @"20 lb";
        newItem.rating = @"ABC";
        newItem.type = @"Water Mist";
        
        [self.fireExtItems addObject:newItem];
        
        
        
    }
}

- (NSMutableArray *) getServiceEvents
{
    NSMutableArray *serviceArray = [[NSMutableArray alloc] init];
    
    int numberOfServices = 5;
    for(int i = 0; i < numberOfServices; i++)
    {
        FXIServiceEvent *newService = [[FXIServiceEvent alloc] init];
        newService.servicedBy = @"Nick";
        NSDate *curr = [NSDate date];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd.MM.YY HH.mm.ss"];
        NSString *date = [format stringFromDate:curr];
        newService.date = date;
        
        newService.note = @"Fixed it yey";
        
        FXIServiceAction *newAction = [[FXIServiceAction alloc] init];
        newAction.name = @"Maintained it";
        newAction.description = @"I did it";
        
        newService.action = newAction;
        
        [serviceArray addObject:newService];
    }
    
    return serviceArray;
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
    // Return the number of rows in the section.
    return [self.fireExtItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TablePrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    FXIFireExtinguisher *newEntry = [self.fireExtItems objectAtIndex:indexPath.row];
    cell.textLabel.text = newEntry.name;
    
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    FXIExtinguisherViewController *vc = [segue destinationViewController];
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    long row = [index row];
    vc.selectedObject = self.fireExtItems[row]; 
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


@end
