//
//  XMPContactsDetailViewController.m
//  ContactsMRC
//
//  Created by conner on 8/11/20.
//  Copyright © 2020 conner. All rights reserved.
//

#import "XMPContactsDetailViewController.h"

@interface XMPContactsDetailViewController ()

// MARK: - IBOutlets
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *emailTF;
@property (retain, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation XMPContactsDetailViewController
// MARK: - IBActions
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
}


// MARK: - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)dealloc {
    [_nameTF release];
    [_emailTF release];
    [_phoneTF release];
    [super dealloc];
}
@end
