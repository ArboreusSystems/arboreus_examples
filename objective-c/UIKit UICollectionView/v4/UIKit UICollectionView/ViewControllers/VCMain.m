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
		
		pTestData = [[NSMutableArray alloc] init];
		
		UICCollectionViewItemObject* oItem1 = [[UICCollectionViewItemObject alloc] init];
		[oItem1 setPName:@"When an unknown printer took"];
		[oItem1 setPDescription:@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."];
		[pTestData addObject:oItem1];

		UICCollectionViewItemObject* oItem2 = [[UICCollectionViewItemObject alloc] init];
		[oItem2 setPName:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry of the printing and typesetting industry"];
		[oItem2 setPDescription:@"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."];
		[pTestData addObject:oItem2];

		UICCollectionViewItemObject* oItem3 = [[UICCollectionViewItemObject alloc] init];
		[oItem3 setPName:@"There are many variations of passages of Lorem Ipsum"];
//		[oItem3 setPName:@"1914 translation by H. Rackham"];
		[oItem3 setPDescription:@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet."];
		[pTestData addObject:oItem3];

		UICCollectionViewItemObject* oItem4 = [[UICCollectionViewItemObject alloc] init];
		[oItem4 setPName:@"The standard chunk of Lorem Ipsum used since The standard chunk of Lorem Ipsum used since The standard chunk of Lorem Ipsum used since"];
		[oItem4 setPDescription:@"The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham."];
		[pTestData addObject:oItem4];

		UICCollectionViewItemObject* oItem5 = [[UICCollectionViewItemObject alloc] init];
		[oItem5 setPName:@"Where can I get some?"];
		[oItem5 setPDescription:@"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."];
		[pTestData addObject:oItem5];
		
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
	return [pTestData count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString* oMessage = [NSString stringWithFormat:@"cellForItemAtIndexPath indexPath: %lu",(unsigned long)[indexPath indexAtPosition:1]];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	UICCollectionViewCell* oCell = (UICCollectionViewCell*)[pCollectionView dequeueReusableCellWithReuseIdentifier:[UICCollectionViewCell mGetClassID] forIndexPath:indexPath];
	[oCell.pButton setTag:[indexPath item]];
	[oCell.pButton addTarget:self action:@selector(mActionCell:) forControlEvents:UIControlEventTouchUpInside];
	[oCell mSetupWithItem:[pTestData objectAtIndex:[indexPath indexAtPosition:1]]];
	if (indexPath == pCurrentItemPath) {
		[oCell.contentView setBackgroundColor:__COLOR_WHITE];
	} else {
		[oCell.contentView setBackgroundColor:__COLOR_BLUE];
	}
	
	return (UICollectionViewCell*)oCell;
}

-(void) mActionCell:(UIButton*)inCell {

	NSString* oMessage = [NSString stringWithFormat:@"Clicked %@",[inCell.titleLabel text]];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

	NSString* oMessage = [NSString stringWithFormat:@"didSelectItemAtIndexPath: %@",indexPath];
	H_LOGGER_MESSAGE_NOTICE(oMessage);

	if (pCurrentItemPath != NULL) {
		UICCollectionViewCell* oCellPrevious = (UICCollectionViewCell*)[collectionView cellForItemAtIndexPath:pCurrentItemPath];
		[oCellPrevious mShowSelected:NO];
	}

	pCurrentItemPath = indexPath;
	UICCollectionViewCell* oCell = (UICCollectionViewCell*)[collectionView cellForItemAtIndexPath:pCurrentItemPath];
	[oCell mShowSelected:YES];
	
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
	
	CGFloat oEstimatedWidth = pCollectionView.frame.size.width - 10 - 10 - 20 - 20;
	CGSize oEstimatedSize = CGSizeMake(oEstimatedWidth, 1000);
	NSDictionary* oAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium]};
	NSString* oNameString= [[pTestData objectAtIndex:[indexPath indexAtPosition:1]] pName];
	CGRect oEstimatedNameFrame = [oNameString boundingRectWithSize:oEstimatedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:oAttributes context:nil];
	
//	CGSize oSize;
//	if ([pGlobal mIsPhone]) {
//		oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width - 30,oEstimatedNameFrame.size.height + 25);
//	} else {
//		if ([pGlobal mIsLandscape]) {
//			oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width / 2 - 20,oEstimatedNameFrame.size.height + 25);
//		} else {
//			oSize = CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width - 30,oEstimatedNameFrame.size.height + 25);
//		}
//	}
	
	return CGSizeMake(
		self.view.safeAreaLayoutGuide.layoutFrame.size.width,
		oEstimatedNameFrame.size.height + 23
	);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	
	NSString* oMessage = [NSString stringWithFormat:@"insetForSectionAtIndex indexPath: %ld",(long)section];
	H_LOGGER_MESSAGE_NOTICE(oMessage);
	
	return UIEdgeInsetsMake(10, 0, 11, 0);
}

- (BOOL)collectionView:(UICollectionView *)collectionView canFocusItemAtIndexPath:(NSIndexPath *)indexPath {

	return NO;
}


// --------------------------------------
#pragma mark - UICollectionViewDataSource

@end
