//
//  XMPContactsTableViewController.m
//  ContactsMRC
//
//  Created by conner on 8/11/20.
//  Copyright © 2020 conner. All rights reserved.
//

#import "XMPContact.h"
#import "XMPContactsTableViewController.h"
#import "XMPContactDetailViewController.h"

@interface XMPContactsTableViewController ()

@property NSMutableArray *contacts;

@end

@implementation XMPContactsTableViewController

#pragma mark - View Lifecycle

-(void)didObserveNewContact:(id)sender {
    [_contacts addObject:[sender object]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Array of contacts
    _contacts = [[NSMutableArray alloc] init];
    XMPContact* contact = [[XMPContact alloc] initWithName:@"Bob" email:@"Bob@gmail.com" phone:@"123-456-7890"];
    XMPContact* contact2 = [[XMPContact alloc] initWithName:@"Joe" email:@"Joe@gmail.com" phone:@"922-294-9934"];
    XMPContact* contact3 = [[XMPContact alloc] initWithName:@"Tony" email:@"Tony@gmail.com" phone:@"555-294-9585"];
    [_contacts addObject:contact];
    [_contacts addObject:contact2];
    [_contacts addObject:contact3];
    [contact release];
    [contact2 release];
    [contact3 release];
    
    // Setup Observer for new contact
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(didObserveNewContact:) name:@"didAddContact" object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[self tableView] reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    cell.textLabel.text = [_contacts[indexPath.row] name];
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [_contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    XMPContactDetailViewController *detailVC = [segue destinationViewController];
    if([segue.identifier isEqual: @"editContactSegue"]) {
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        detailVC.contact = _contacts[indexPath.row];
    }
}


- (void)dealloc {
    [_contacts removeAllObjects];
    [_contacts dealloc];
    [super dealloc];
}
@end
