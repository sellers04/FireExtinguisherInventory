//
//  FXIAddServiceViewController.m
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import "FXIAddServiceViewController.h"
#import "FXIServiceAction.h"


@interface FXIAddServiceViewController ()

@property (strong, nonatomic) NSArray *serviceActions;

@end

@implementation FXIAddServiceViewController



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return _serviceActions.count;
   // return 2;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    FXIServiceAction *printAction = _serviceActions[row];
    return printAction.name;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
}



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

    [self createServiceActions];
    self.actionPicker.dataSource = self;
    self.actionPicker.delegate = self;
    self.inspectorNameBox.delegate = self;
    self.serviceNotes.delegate = self;
    self.serviceNotes.layer.borderWidth = 2.0f;
    self.serviceNotes.layer.borderColor = [[UIColor grayColor] CGColor];
    
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [self.inspectorNameBox resignFirstResponder];
    return YES;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
        [textView resignFirstResponder];
    return YES;
}


- (void) createServiceActions
{
    FXIServiceAction *newAction1 = [[FXIServiceAction alloc] init];
    newAction1.name = @"General Maintenance";
    newAction1.description = @"maximum fixing";
    
    FXIServiceAction *newAction2 = [[FXIServiceAction alloc] init];
    newAction2.name = @"Recharged";
    newAction2.description = @"maximum fixing";
    
    FXIServiceAction *newAction3 = [[FXIServiceAction alloc] init];
    newAction3.name = @"Replaced";
    newAction3.description = @"maximum fixing";
    
    _serviceActions = @[newAction1, newAction2, newAction3];
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
    
    if (sender != self.confirmButton) return;
    if (self.inspectorNameBox.text.length > 0)
    {
        FXIServiceEvent *newServiceEvent = [[FXIServiceEvent alloc] init];
        newServiceEvent.servicedBy = self.inspectorNameBox.text;
        
        NSDate *curr = [NSDate date];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd.MM.YY HH.mm.ss"];
        NSString *date = [format stringFromDate:curr];
        newServiceEvent.date = date;
        
        newServiceEvent.note = self.serviceNotes.text;
        
        newServiceEvent.action = _serviceActions[[self.actionPicker selectedRowInComponent:0]];
 
        [self.fireExt addNewServiceEvent:newServiceEvent];
    
    }
    
}


@end
