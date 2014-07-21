//
//  FXIExtinguisherViewController.m
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import "FXIExtinguisherViewController.h"
#import "FXIAddServiceViewController.h"
#import "FXIServiceHistoryTableViewController.h"

@interface FXIExtinguisherViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fireExtName;
@property (weak, nonatomic) IBOutlet UILabel *fireExtId;
@property (weak, nonatomic) IBOutlet UILabel *fireExtLocation;
@property (weak, nonatomic) IBOutlet UILabel *fireExtLastService;
@property (weak, nonatomic) IBOutlet UIButton *addServiceButton;
@property (weak, nonatomic) IBOutlet UIButton *serviceHistoryButton;

@end

@implementation FXIExtinguisherViewController


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
    // Do any additional setup after loading the view.
    [self loadObjectData];
}

- (void)loadObjectData
{
    _fireExtName.text = [NSString stringWithFormat:@"Name: %@",self.selectedObject.name];
    _fireExtId.text = [NSString stringWithFormat:@"ID: %@",self.selectedObject.idValue];
    _fireExtLocation.text = [NSString stringWithFormat:@"Location: %@ %@ %@ %@", self.selectedObject.location.building, self.selectedObject.location.floor, self.selectedObject.location.section, self.selectedObject.location.room];
    FXIServiceEvent *event = [self.selectedObject.serviceEvents objectAtIndex:0];
    _fireExtLastService.text = event.date;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender == self.addServiceButton)
    {
        FXIAddServiceViewController *vcAdd = [segue destinationViewController];
        vcAdd.fireExt = self.selectedObject;
    }
    else if (sender == self.serviceHistoryButton)
    {
        FXIServiceHistoryTableViewController *vcView = [segue destinationViewController];
        vcView.fireExt = self.selectedObject;
    }
}

- (IBAction)unwindToExtinguisherView:(UIStoryboardSegue *)segue
{
    NSLog(@"segue: %@", segue.identifier);

}



@end
