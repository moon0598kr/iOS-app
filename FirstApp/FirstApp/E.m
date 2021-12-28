//
//  E.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/16.
//
#import <AudioToolbox/AudioToolbox.h>
#import "E.h"

@interface E ()

@property (nonatomic, strong) ZXCapture *capture;
@property (weak, nonatomic) IBOutlet UIView *scanRectView;
@property (nonatomic) BOOL scanning;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) BOOL isFirstApplyOrientation;
@end

@implementation E {
    CGAffineTransform _captureSizeTransform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.capture = [[ZXCapture alloc] init];
    self.capture.sessionPreset = AVCaptureSessionPreset1920x1080;
    self.capture.camera = self.capture.back;
    self.capture.focusMode = AVCaptureFocusModeContinuousAutoFocus;
    self.capture.delegate = self;
    
    self.scanning = NO;
    
    [self.view.layer addSublayer:self.capture.layer];
    
    [self.view bringSubviewToFront:self.scanRectView];
    
  //  [self.view bringSubviewToFront:self.decodedLabel];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
    [_resultLabel setHidden:true];
    
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  
  if (_isFirstApplyOrientation) return;
  _isFirstApplyOrientation = TRUE;
  [self applyOrientation];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
  [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
  [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
  } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
   {
     [self applyOrientation];
   }];
}

- (void)applyOrientation {
  UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  float scanRectRotation;
  float captureRotation;
  
  switch (orientation) {
    case UIInterfaceOrientationPortrait:
      captureRotation = 0;
      scanRectRotation = 90;
      break;
    case UIInterfaceOrientationLandscapeLeft:
      captureRotation = 90;
      scanRectRotation = 180;
      break;
    case UIInterfaceOrientationLandscapeRight:
      captureRotation = 270;
      scanRectRotation = 0;
      break;
    case UIInterfaceOrientationPortraitUpsideDown:
      captureRotation = 180;
      scanRectRotation = 270;
      break;
    default:
      captureRotation = 0;
      scanRectRotation = 90;
      break;
  }
  self.capture.layer.frame = self.view.frame;
  CGAffineTransform transform = CGAffineTransformMakeRotation((CGFloat) (captureRotation / 180 * M_PI));
  [self.capture setTransform:transform];
  [self.capture setRotation:scanRectRotation];
  
  [self applyRectOfInterest:orientation];
}

- (void)applyRectOfInterest:(UIInterfaceOrientation)orientation {
  CGFloat scaleVideoX, scaleVideoY;
  CGFloat videoSizeX, videoSizeY;
  CGRect transformedVideoRect = self.scanRectView.frame;
  if([self.capture.sessionPreset isEqualToString:AVCaptureSessionPreset1920x1080]) {
    videoSizeX = 1080;
    videoSizeY = 1920;
  } else {
    videoSizeX = 720;
    videoSizeY = 1280;
  }
  if(UIInterfaceOrientationIsPortrait(orientation)) {
    scaleVideoX = self.capture.layer.frame.size.width / videoSizeX;
    scaleVideoY = self.capture.layer.frame.size.height / videoSizeY;
    
    // Convert CGPoint under portrait mode to map with orientation of image
    // because the image will be cropped before rotate
    // reference: https://github.com/TheLevelUp/ZXingObjC/issues/222
    CGFloat realX = transformedVideoRect.origin.y;
    CGFloat realY = self.capture.layer.frame.size.width - transformedVideoRect.size.width - transformedVideoRect.origin.x;
    CGFloat realWidth = transformedVideoRect.size.height;
    CGFloat realHeight = transformedVideoRect.size.width;
    transformedVideoRect = CGRectMake(realX, realY, realWidth, realHeight);
    
  } else {
    scaleVideoX = self.capture.layer.frame.size.width / videoSizeY;
    scaleVideoY = self.capture.layer.frame.size.height / videoSizeX;
  }
  
  _captureSizeTransform = CGAffineTransformMakeScale(1.0/scaleVideoX, 1.0/scaleVideoY);
  self.capture.scanRect = CGRectApplyAffineTransform(transformedVideoRect, _captureSizeTransform);
}

- (NSString *)barcodeFormatToString:(ZXBarcodeFormat)format {
  switch (format) {
    case kBarcodeFormatAztec:
      return @"Aztec";
      
    case kBarcodeFormatCodabar:
      return @"CODABAR";
      
    case kBarcodeFormatCode39:
      return @"Code 39";
      
    case kBarcodeFormatCode93:
      return @"Code 93";
      
    case kBarcodeFormatCode128:
      return @"Code 128";
      
    case kBarcodeFormatDataMatrix:
      return @"Data Matrix";
      
    case kBarcodeFormatEan8:
      return @"EAN-8";
      
    case kBarcodeFormatEan13:
      return @"EAN-13";
      
    case kBarcodeFormatITF:
      return @"ITF";
      
    case kBarcodeFormatPDF417:
      return @"PDF417";
      
    case kBarcodeFormatQRCode:
      return @"QR Code";
      
    case kBarcodeFormatRSS14:
      return @"RSS 14";
      
    case kBarcodeFormatRSSExpanded:
      return @"RSS Expanded";
      
    case kBarcodeFormatUPCA:
      return @"UPCA";
      
    case kBarcodeFormatUPCE:
      return @"UPCE";
      
    case kBarcodeFormatUPCEANExtension:
      return @"UPC/EAN extension";
      
    default:
      return @"Unknown";
  }
}

- (void)captureCameraIsReady:(ZXCapture *)capture {
  self.scanning = YES;
}

- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result {
  if (!self.scanning) return;
  if (!result) return;
  
  // We got a result.
  [self.capture stop];
  self.scanning = NO;
  
  // Display found barcode location
  CGAffineTransform inverse = CGAffineTransformInvert(_captureSizeTransform);
  NSMutableArray *points = [[NSMutableArray alloc] init];
  NSString *location = @"";
  for (ZXResultPoint *resultPoint in result.resultPoints) {
    CGPoint cgPoint = CGPointMake(resultPoint.x, resultPoint.y);
    CGPoint transformedPoint = CGPointApplyAffineTransform(cgPoint, inverse);
    transformedPoint = [self.scanRectView convertPoint:transformedPoint toView:self.scanRectView.window];
    NSValue* windowPointValue = [NSValue valueWithCGPoint:transformedPoint];
    location = [NSString stringWithFormat:@"%@ (%f, %f)", location, transformedPoint.x, transformedPoint.y];
    [points addObject:windowPointValue];
  }
  
  // Display information about the result onscreen.
  NSString *formatString = [self barcodeFormatToString:result.barcodeFormat];
  NSString *display = [NSString stringWithFormat:@"Scanned!\n\nFormat: %@\n\nContents:\n%@\nLocation: %@", formatString, result.text, location];
    NSURL *qrURL = [NSURL URLWithString: result.text];
    [[UIApplication sharedApplication] openURL:qrURL];
   
    [_resultLabel setHidden:!_resultLabel.isHidden];
    NSLog(@"%@", result.text);
    //NSLog(@"%@",display);
    [_resultLabel setText:display];
    
    //[_resultLabel setHidden:true];

     
 // [self.decodedLabel performSelectorOnMainThread:@selector(setText:) withObject:display waitUntilDone:YES];
  
  // Vibrate
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    [self->_resultLabel setHidden:true];
    self.scanning = YES;
    [self.capture start];
  });
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
