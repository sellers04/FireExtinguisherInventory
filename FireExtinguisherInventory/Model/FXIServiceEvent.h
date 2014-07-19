//
//  FXIServiceEvent.h
//  FireExtinguisherInventory
//
//  Created by norredm on 7/18/14.
//  Copyright (c) 2014 oregonstate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXIServiceAction.h"


@interface FXIServiceEvent : NSObject

@property (strong, nonatomic) NSString *servicedBy;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *note;
@property (strong, nonatomic) FXIServiceAction *action;

@end
