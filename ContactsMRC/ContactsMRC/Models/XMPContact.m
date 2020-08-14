//
//  XMPContact.m
//  ContactsMRC
//
//  Created by conner on 8/11/20.
//  Copyright © 2020 conner. All rights reserved.
//

#import "XMPContact.h"

@implementation XMPContact

-(instancetype)initWithName:(NSString*)name email:(NSString*)email phone:(NSString*)phone {
    if(self = [super init]) {
        _name = name;
        _email = email;
        _phone = phone;
    }
    return self;
}

- (void)dealloc {
    [_name release];
    [_email release];
    [_phone release];
    [super dealloc];
}

@end
