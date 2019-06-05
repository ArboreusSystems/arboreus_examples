//
//  MainViewController.m
//  Camera
//
//  Created by Alexandr Kirilov on 05/06/2019.
//  Copyright © 2019 none. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIImagePickerController *oImagePicker;
@property (nonatomic, strong) UIImage *oImage;

@end

@implementation MainViewController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
    self.oImagePicker = [[UIImagePickerController alloc] init];
    self.oImagePicker.delegate = self;
    self.oImagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
    self.oImagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.oImagePicker.allowsEditing = YES;
    [self presentViewController:self.oImagePicker animated:YES completion:NULL];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {

	UIImage *oNewImage = info[UIImagePickerControllerOriginalImage];
	if (!oNewImage) {
		oNewImage = info[UIImagePickerControllerOriginalImage];
	}
	self.oImage = oNewImage;
	[self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {

	[self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) didReceiveMemoryWarning {

	[super didReceiveMemoryWarning];
}

@end
