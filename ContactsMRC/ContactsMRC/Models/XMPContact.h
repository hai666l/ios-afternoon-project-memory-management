//
//  XMPContact.h
//  ContactsMRC
//
//  Created by conner on 8/11/20.
//  Copyright © 2020 conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMPContact : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phone;

-(instancetype)initWithName:(NSString*)name email:(NSString*)email phone:(NSString*)phone;

@end

NS_ASSUME_NONNULL_END
