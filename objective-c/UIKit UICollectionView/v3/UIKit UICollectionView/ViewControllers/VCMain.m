//
//  VCMain.m
//  UIKit UICollectionView
//
//  Created by Alexandr Kirilov on 25/05/2020.
//  Copyright © 2020 Alexandr Kirilov. All rights reserved.
//

#import "VCMain.h"

@interface VCMain ()

@end

@implementation VCMain


// --------------------------------------
#pragma mark - Initialisation

-(instancetype) init {
	
	self = [super init];
	if (self) {
		
		pGlobal = [HGlobal mInstance];
		pLogger = [HLogger mInstance];
		
	}
	return self;
}


// --------------------------------------
#pragma mark - Lifeycle

-(void) loadView {
	
	H_LOGGER_MESSAGE_NOTICE(@"loadView");
	[super loadView];
	
	[self setTitle:@"UICollectionView demo"];
	
	pClassID = @"UICollectionViewCell";
	
	pCollectionFlowLayot = [[UICollectionViewFlowLayout alloc] init];
	[pCollectionFlowLayot setMinimumLineSpacing:10];
	[pCollectionFlowLayot setMinimumLineSpacing:10];
	[pCollectionFlowLayot setSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
	
	pCollectionView = [[UICCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:pCollectionFlowLayot];
	[pCollectionView setBackgroundColor:__COLOR_PURPLE];
	[pCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pCollectionView registerClass:[UICCollectionViewCell class] forCellWithReuseIdentifier:[UICCollectionViewCell mGetClassID]];
	[pCollectionView setDelegate:self];
	[pCollectionView setDataSource:self];
	
	pContent = [[UIView alloc] init];
	[pContent setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pContent setBackgroundColor:__COLOR_GREEN_LIGHT];
	
	pContentWrapper = [[UIView alloc] init];
	[pContentWrapper setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pContentWrapper setBackgroundColor:__COLOR_GREEN_DARK];
}

-(void) loadViewIfNeeded {

	H_LOGGER_MESSAGE_NOTICE(@"loadViewIfNeeded");
	[super loadViewIfNeeded];
}

-(void) viewDidLoad {

	H_LOGGER_MESSAGE_NOTICE(@"viewDidLoad");
    [super viewDidLoad];
    
    [self.view addSubview:pContentWrapper];
    [[pContentWrapper.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
    [[pContentWrapper.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
    [[pContentWrapper.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
    [[pContentWrapper.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
    
    [pContentWrapper addSubview:pContent];
    [[pContent.topAnchor constraintEqualToAnchor:pContentWrapper.topAnchor] setActive:YES];
    [[pContent.bottomAnchor constraintEqualToAnchor:pContentWrapper.bottomAnchor] setActive:YES];
    [[pContent.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
    [[pContent.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
    
    [pContent addSubview:pCollectionView];
    [[pCollectionView.topAnchor constraintEqualToAnchor:pContent.topAnchor] setActive:YES];
	[[pCollectionView.bottomAnchor constraintEqualToAnchor:pContent.bottomAnchor] setActive:YES];
	[[pCollectionView.leftAnchor constraintEqualToAnchor:pContent.leftAnchor] setActive:YES];
	[[pCollectionView.rightAnchor constraintEqualToAnchor:pContent.rightAnchor] setActive:YES];
}

-(void) viewWillAppear:(BOOL)animated {
	
	H_LOGGER_MESSAGE_NOTICE(@"viewWillAppear");
	[super viewDidLoad];
}

-(void) viewWillLayoutSubviews {

	H_LOGGER_MESSAGE_NOTICE(@"viewWillLayoutSubviews");
	[super viewWillLayoutSubviews];
}

-(void) viewDidLayoutSubviews {

	H_LOGGER_MESSAGE_NOTICE(@"viewDidLayoutSubviews");
	[super viewDidLayoutSubviews];
	
}

-(void) viewDidAppear:(BOOL)animated {
	
	H_LOGGER_MESSAGE_NOTICE(@"viewDidAppear");
	[super viewDidAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated {

	H_LOGGER_MESSAGE_NOTICE(@"viewWillDisappear");
	[super viewWillDisappear:animated];
}

-(void) viewDidDisappear:(BOOL)animated {

	H_LOGGER_MESSAGE_NOTICE(@"viewDidDisappear");
	[super viewDidDisappear:animated];
}

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

	H_LOGGER_MESSAGE_NOTICE(@"viewWillTransitionToSize");
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	[pCollectionView.collectionViewLayout invalidateLayout];
}

-(void) beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated {
	
	H_LOGGER_MESSAGE_NOTICE(@"beginAppearanceTransition");
	[super beginAppearanceTransition:isAppearing animated:animated];
}

-(void) endAppearanceTransition {

	H_LOGGER_MESSAGE_NOTICE(@"endAppearanceTransition");
	[super endAppearanceTransition];
}


// --------------------------------------
#pragma mark - UICollectionViewDelegate

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	H_LOGGER_MESSAGE_NOTICE(@"numberOfSectionsInCollectionView");
	return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	H_LOGGER_MESSAGE_NOTICE(@"numberOfItemsInSection");
	return 23;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString* oMessage = [NSString stringWithFormat:@"cellForItemAtIndexPath indexPath: %lu",(unsigned long)[indexPath indexAtPosition:1]];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	UICCollectionViewCell* oCell = [pCollectionView dequeueReusableCellWithReuseIdentifier:[UICCollectionViewCell mGetClassID] forIndexPath:indexPath];
	[oCell.pButton setTag:[indexPath item]];
	[oCell.pButton addTarget:self action:@selector(mActionCell:) forControlEvents:UIControlEventTouchUpInside];
	[oCell mSetupWithTitle:[NSString stringWithFormat:@"Button %lu",(unsigned long)[indexPath indexAtPosition:1]]];
	if (indexPath == pCurrentItemPath) {
		[oCell.contentView setBackgroundColor:__COLOR_WHITE];
	} else {
		[oCell.contentView setBackgroundColor:__COLOR_BLUE];
	}
	
	return oCell;
}

-(void) mActionCell:(UIButton*)inCell {

	NSString* oMessage = [NSString stringWithFormat:@"Clicked %@",[inCell.titleLabel text]];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

	NSString* oMessage = [NSString stringWithFormat:@"didSelectItemAtIndexPath: %@",indexPath];
	H_LOGGER_MESSAGE_NOTICE(oMessage);

	if (pCurrentItemPath != NULL) {
		UICollectionViewCell *oCellPrevious = [collectionView cellForItemAtIndexPath:pCurrentItemPath];
		[oCellPrevious.contentView setBackgroundColor:__COLOR_BLUE];
	}

	pCurrentItemPath = indexPath;
	UICollectionViewCell *oCellPrevious = [collectionView cellForItemAtIndexPath:pCurrentItemPath];
	[oCellPrevious.contentView setBackgroundColor:__COLOR_WHITE];
	
}

-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString* oMessage = [NSString stringWithFormat:@"didDeselectItemAtIndexPath: %@",indexPath];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	UICollectionViewCell *oCell = [collectionView cellForItemAtIndexPath:pCurrentItemPath];
	[oCell.contentView setBackgroundColor:__COLOR_BLUE];
	[collectionView deselectItemAtIndexPath:pCurrentItemPath animated:YES];
}


// --------------------------------------
#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString* oMessage = [NSString stringWithFormat:@"sizeForItemAtIndexPath indexPath: %lu",(unsigned long)[indexPath indexAtPosition:1]];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	CGSize oSize;
	if ([pGlobal mIsPhone]) {
		oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width - 30,100);
	} else {
		if ([pGlobal mIsLandscape]) {
			oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width / 2 - 20,100);
		} else {
			oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width - 30,100);
		}
	}
	
	return oSize;
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	
	NSString* oMessage = [NSString stringWithFormat:@"insetForSectionAtIndex indexPath: %ld",(long)section];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	return UIEdgeInsetsMake(15,15,15,15);
}

- (BOOL)collectionView:(UICollectionView *)collectionView canFocusItemAtIndexPath:(NSIndexPath *)indexPath {

	return NO;
}


// --------------------------------------
#pragma mark - UICollectionViewDataSource

@end
