//
//  XMPContactDetailViewController.m
//  ContactsMRC
//
//  Created by conner on 8/11/20.
//  Copyright © 2020 conner. All rights reserved.
//

#import "XMPContact.h"
#import "XMPContactDetailViewController.h"

@interface XMPContactDetailViewController ()
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *emailTF;
@property (retain, nonatomic) IBOutlet UITextField *phoneTF;
@end

@implementation XMPContactDetailViewController
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    // Ensure fields have input
    if(![_nameTF.text isEqual: @""] && ![_emailTF.text isEqual: @""] && ![_phoneTF.text isEqual: @""]) {
        if(_contact == nil) {
            // Add Contact
            _contact = [[XMPContact alloc] initWithName:_nameTF.text email:_emailTF.text phone:_phoneTF.text];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"didAddContact" object:_contact];
        } else {
            // Edit Contact
            _contact.name = _nameTF.text;
            _contact.email = _emailTF.text;
            _contact.phone = _phoneTF.text;
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Fill input fields if editing
    if(_contact != nil) {
        _nameTF.text = _contact.name;
        _emailTF.text = _contact.email;
        _phoneTF.text = _contact.phone;
    }
}

- (void)dealloc {
    [_nameTF release];
    [_emailTF release];
    [_phoneTF release];
    [_contact release];
    [super dealloc];
}
@end
