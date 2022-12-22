//
//  AAsyncAwaitView.m
//  AsyncAwait_v1
//
//  Created by Alexandr Kirilov on 22/12/2022.
//

#import "AAsyncAwaitView.h"

@implementation AAsyncAwaitView


// ---------------------------------
#pragma mark - Init

-(instancetype) initWithFrame:(CGRect)inFrame {
	
	self = [super initWithFrame:inFrame];
	if (self) {
	
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self setBackgroundColor:__COLOR_ORANGE];
		
		[self setPAsyncAwait:[[AAsyncAwait alloc] init]];
		
		[self setPCellID:@"Cell"];
		
		[self setPButtonGetUsers:[[AButtonTemplate alloc] initWithFrame:CGRectMake(0, 0, 0, 0)]];
		[_pButtonGetUsers setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pButtonGetUsers setTitle:@"Get Users" forState:UIControlStateNormal];
		[_pButtonGetUsers addTarget:self action:@selector(mActionGetUsers:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_pButtonGetUsers];
		
		[self setPTableView:[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain]];
		[_pTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_pCellID];
		[_pTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
		[_pTableView setBackgroundColor:__COLOR_SALAD_DARK];
		[_pTableView setDelegate:self];
		[_pTableView setDataSource:self];
		[self addSubview:_pTableView];
		
	}
	return self;
}

-(void) layoutSubviews {
	
	[super layoutSubviews];
	
	[_pButtonGetUsers removeConstraints:[_pButtonGetUsers constraints]];
	[[_pButtonGetUsers.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
	[[_pButtonGetUsers.heightAnchor constraintEqualToConstant:80.0] setActive:YES];
	[[_pButtonGetUsers.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
	[[_pButtonGetUsers.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
	
	[_pTableView removeConstraints:[_pTableView constraints]];
	[[_pTableView.topAnchor constraintEqualToAnchor:_pButtonGetUsers.bottomAnchor] setActive:YES];
	[[_pTableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
	[[_pTableView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
	[[_pTableView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
}


// ---------------------------------
#pragma mark - Actions

-(void) mActionGetUsers:(id)inSender {
	
	[_pAsyncAwait mFetchUsersWithCompletionHandler:^(NSArray* _Nonnull inUsers) {
		[self setPUsers:inUsers];
		dispatch_async(dispatch_get_main_queue(), ^{
			[self->_pTableView reloadData];
		});
	}];
	
	NSLog(@"ACTION Get Users");
}


// ---------------------------------
#pragma mark - UITableViewDelegate

-(NSInteger) tableView:(UITableView*)inTableView numberOfRowsInSection:(NSInteger)inSection {

	return _pUsers.count;
}

-(CGFloat) tableView:(UITableView*)inTableView heightForRowAtIndexPath:(NSIndexPath*)inIndexPath {
	
	CGFloat oOutput = 80.0;
	return  oOutput;
}

-(UITableViewCell*) tableView:(UITableView*)inTableView cellForRowAtIndexPath:(NSIndexPath*)inIndexPath {
	
	UITableViewCell* oCell = [_pTableView dequeueReusableCellWithIdentifier:_pCellID];
	
	UIListContentConfiguration* oContentConfig = [oCell defaultContentConfiguration];
	[oContentConfig setText:_pUsers[inIndexPath.row]];
	[oCell setContentConfiguration:oContentConfig];
	
	return oCell;
}

@end
