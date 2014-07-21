//
//  FXIViewServiceViewController.m
//  FireExtinguisherInventory
//
//  Created by Nick on 7/21/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FXIViewServiceViewController.h"

@interface FXIViewServiceViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *topLabel;

@end

@implementation FXIViewServiceViewController

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
    _topLabel.title = [NSString stringWithFormat:@"%@",self.displayEvent.date];
    
    _nameLabel.text = [NSString stringWithFormat:@"Serviced by: %@",self.displayEvent.servicedBy];
    _dateLabel.text = [NSString stringWithFormat:@"Date: %@",self.displayEvent.date];
    _actionLabel.text = [NSString stringWithFormat:@"Action: %@",self.displayEvent.action.name];
    _notesLabel.text = [NSString stringWithFormat:@"Notes: %@",self.displayEvent.note];
  
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
}


@end
