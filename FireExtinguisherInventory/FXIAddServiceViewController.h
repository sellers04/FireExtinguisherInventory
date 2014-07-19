//
//  FXIAddServiceViewController.h
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXIFireExtinguisher.h"

@interface FXIAddServiceViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *actionPicker;
@property (weak, nonatomic) IBOutlet UITextField *inspectorNameBox;
@property (weak, nonatomic) IBOutlet UITextView *serviceNotes;

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) FXIFireExtinguisher *fireExt;

@end
