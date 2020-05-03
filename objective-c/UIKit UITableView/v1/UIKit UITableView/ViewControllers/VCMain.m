//
//  VCMain.m
//  UIKit UITableView
//
//  Created by Alexandr Kirilov on 01/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"

@interface VCMain ()

@end

@implementation VCMain

-(instancetype) init {
	
	self = [super init];
	if (self) {
	
		[self.view setBackgroundColor:__COLOR_BLUE_LIGHT];
		[self setTitle:@"Settings"];
		
		[self mInitViewStructure];
	}
	return self;
}

-(void) mInitViewStructure {
	
	pViewStructure = [NSMutableDictionary dictionary];
	
	NSMutableDictionary* oGroup1 = [NSMutableDictionary dictionary];
	[oGroup1 setValue:@"Element 1" forKey:@"Key1"];
	[oGroup1 setValue:@"Element 2" forKey:@"Key2"];
	[oGroup1 setValue:@"Element 3" forKey:@"Key3"];
	[pViewStructure setValue:oGroup1 forKey:@"Group1"];
	
	NSMutableDictionary* oGroup2 = [NSMutableDictionary dictionary];
	[oGroup2 setValue:@"Element 1" forKey:@"Key1"];
	[oGroup2 setValue:@"Element 2" forKey:@"Key2"];
	[oGroup2 setValue:@"Element 3" forKey:@"Key3"];
	[oGroup2 setValue:@"Element 4" forKey:@"Key4"];
	[oGroup2 setValue:@"Element 5" forKey:@"Key5"];
	[pViewStructure setValue:oGroup2 forKey:@"Group2"];
	
	NSMutableDictionary* oGroup3 = [NSMutableDictionary dictionary];
	[oGroup3 setValue:@"Element 1" forKey:@"Key1"];
	[pViewStructure setValue:oGroup3 forKey:@"Group3"];
}

-(void) loadView {
	
	[super loadView];
	
	_pTableView = [[TableViewTemplate alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	[_pTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_pTableView setDelegate:self];
	[_pTableView setDataSource:self];
	[_pTableView setBackgroundColor:__COLOR_WHITE];
	

}

-(void)viewDidLoad {
	
	[super viewDidLoad];
	[self.view addSubview:_pTableView];
	
	[_pTableView registerClass:[Element1Cell class] forCellReuseIdentifier:[Element1Cell mIdentifier]];
	[_pTableView registerClass:[Element2Cell class] forCellReuseIdentifier:[Element2Cell mIdentifier]];
	[_pTableView registerClass:[Element3Cell class] forCellReuseIdentifier:[Element3Cell mIdentifier]];
	[_pTableView registerClass:[Element4Cell class] forCellReuseIdentifier:[Element4Cell mIdentifier]];
	[_pTableView registerClass:[Element5Cell class] forCellReuseIdentifier:[Element5Cell mIdentifier]];
}

-(void) viewDidLayoutSubviews {
	
	[super viewDidLayoutSubviews];
	
	[_pTableView removeConstraints:_pTableView.constraints];
	[_pTableView removeFromSuperview];
	[self.view addSubview:_pTableView];
	[[_pTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[_pTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[_pTableView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[_pTableView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	
	return [pViewStructure count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSMutableDictionary* oSectionValues;
	NSInteger oOutput = 0;
	
	switch (section) {
		case 0:
			NSLog(@"Section: %ld",(long)section);
			oSectionValues = [pViewStructure valueForKey:@"Group1"];
			oOutput = [oSectionValues count];
			break;
		case 1:
			NSLog(@"Section: %ld",(long)section);
			oSectionValues = [pViewStructure valueForKey:@"Group2"];
			oOutput = [oSectionValues count];
			break;
		case 2:
			oSectionValues = [pViewStructure valueForKey:@"Group3"];
			oOutput = [oSectionValues count];
			break;
		default:
			oOutput = 0;
			break;
	}
	
	return oOutput;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	
	UIView* oSectionView = [[UIView alloc] init];
	[oSectionView setBackgroundColor:__COLOR_BLUE];
	
	UILabel* oLabel = [[UILabel alloc] init];
	switch (section) {
		case 0: [oLabel setText:@"Group 1"]; break;
    	case 1: [oLabel setText:@"Group 2"]; break;
		case 2: [oLabel setText:@"Group 3"]; break;
		default: break;
	}
	[oLabel setTextColor:__COLOR_WHITE];
	[oLabel setFont:[UIFont boldSystemFontOfSize:15.0]];
	[oSectionView addSubview:oLabel];
	[oLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
	[[oLabel.centerYAnchor constraintEqualToAnchor:oSectionView.centerYAnchor] setActive:YES];
	[[oLabel.leftAnchor constraintEqualToAnchor:oSectionView.leftAnchor constant:15.0] setActive:YES];
	
	return  oSectionView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	return 50;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSLog(@"cellForRowAtIndexPath: %@ Group: %lu Element: %lu",indexPath,(unsigned long)[indexPath indexAtPosition:0],(unsigned long)[indexPath indexAtPosition:1]);
	
	id oCell = [[UITableViewCell alloc] init];
	NSInteger oGroup = [indexPath indexAtPosition:0];
	NSInteger oElement = [indexPath indexAtPosition:1];
	
	if (oGroup == 0) {
		switch (oElement) {
  			case 0:
  				oCell = (Element1Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element1Cell mIdentifier] forIndexPath:indexPath];
  				[oCell  mSetup];
  				break;
  			case 1:
  				oCell = (Element2Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element2Cell mIdentifier] forIndexPath:indexPath];
  				break;
			case 2:
				oCell = (Element3Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element3Cell mIdentifier] forIndexPath:indexPath];
				break;
  			default:
  				break;
  		}
	}
	
	if (oGroup == 1) {
		switch (oElement) {
  			case 0:
  				oCell = (Element1Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element1Cell mIdentifier] forIndexPath:indexPath];
  				[oCell  mSetup];
  				break;
  			case 1:
  				oCell = (Element2Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element2Cell mIdentifier] forIndexPath:indexPath];
  				break;
			case 2:
				oCell = (Element3Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element3Cell mIdentifier] forIndexPath:indexPath];
				break;
			case 3:
				oCell = (Element4Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element4Cell mIdentifier] forIndexPath:indexPath];
				break;
			case 4:
				oCell = (Element5Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element5Cell mIdentifier] forIndexPath:indexPath];
				break;
  			default:
  				break;
  		}
	}
	
	if (oGroup == 2) {
		switch (oElement) {
  			case 0:
  				oCell = (Element1Cell*)[_pTableView dequeueReusableCellWithIdentifier:[Element1Cell mIdentifier] forIndexPath:indexPath];
  				[oCell  mSetup];
  				break;
  			default:
  				break;
  		}
	}
	
	return (UITableViewCell*)oCell;
}

@end
