//
//  FXIFireExtinguisher.h
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXIServiceEvent.h"
#import "FXILocation.h"
#import "FXIServiceAction.h"

@interface FXIFireExtinguisher : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *idValue;
@property (strong, nonatomic) FXILocation *location;
@property (strong, nonatomic) NSMutableArray *serviceEvents;
@property (strong, nonatomic) NSMutableString *note;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSNumber *yearMade;
@property (strong, nonatomic) NSMutableString *inspectionInterval;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *type;

- (void) addNewServiceEvent:(FXIServiceEvent *) service;

- (void) addNewNote:(NSString *)newNote;

- (void) changeInspectionInterval:(NSString *)newInterval;

@end
