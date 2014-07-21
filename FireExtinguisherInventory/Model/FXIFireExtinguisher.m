//
//  FXIFireExtinguisher.m
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import "FXIFireExtinguisher.h"

@implementation FXIFireExtinguisher

- (NSMutableString *) note
{
    if (!_note)
    {
        _note = [[NSMutableString alloc] init];
    
    }
    
    return _note;
    
}

- (NSMutableString *) inspectionInterval
{
    if(!_inspectionInterval)
    {
        _inspectionInterval = [[NSMutableString alloc] init];
        
        
    }
    return _inspectionInterval;
}

- (void) addNewServiceEvent:(FXIServiceEvent *) service
{
    [self.serviceEvents addObject:service];


}


@end
