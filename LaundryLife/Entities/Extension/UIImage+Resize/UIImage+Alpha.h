

//
//  Created by Chirag Patel on 7/21/18.
//  Copyright © 2018 Spark.multiz. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIImage (Alpha)
- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;


@end
