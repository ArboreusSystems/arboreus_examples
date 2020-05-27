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

-(void) loadView {

	[super loadView];
	
	[self setTitle:@"UICollectionView demo"];
	
	pClassID = @"UICollectionViewCell";
	
	pCollectionFlowLayot = [[UICollectionViewFlowLayout alloc] init];
	
	pCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:pCollectionFlowLayot];
	[pCollectionView setBackgroundColor:__COLOR_PURPLE];
	[pCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[pCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:pClassID];
	[pCollectionView setDelegate:self];
	[pCollectionView setDataSource:self];
}

-(void) viewDidLoad {

    [super viewDidLoad];
    [self.view addSubview:pCollectionView];
}

-(void) viewDidLayoutSubviews {

	[super viewDidLayoutSubviews];
	
	[[pCollectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor] setActive:YES];
	[[pCollectionView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor] setActive:YES];
	[[pCollectionView.leftAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leftAnchor] setActive:YES];
	[[pCollectionView.rightAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.rightAnchor] setActive:YES];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

	return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

	return 10;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell* oCell = [pCollectionView dequeueReusableCellWithReuseIdentifier:pClassID forIndexPath:indexPath];
	[oCell setBackgroundColor:__COLOR_BLUE];
	return oCell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	return CGSizeMake(self.view.safeAreaLayoutGuide.layoutFrame.size.width / 2 - 20,200);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

	return UIEdgeInsetsMake(10, 10, 10, 5);
}

@end
