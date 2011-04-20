/* The MIT License
 
 Copyright (c) 2011 Paul Crawford
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE. */

//  PCCustomSwitch.m

#import "PCCustomSwitch.h"

@implementation PCCustomSwitch

@synthesize slideBg;
@synthesize leftBg;
@synthesize rightBg;
@synthesize slider;
@synthesize rightLabel;
@synthesize leftLabel;
@synthesize tapRecognizer;
@synthesize rightSwipeRecognizer;
@synthesize leftSwipeRecognizer;
@synthesize blueGradient;
@synthesize whiteGradient;
@synthesize delegate;
@synthesize isOn;

// w: 94 | h: 27
- (id)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    UIColor *borderColor = [UIColor colorWithRed:126.0f/255.0f green:126.0f/255.0f blue:126.0f/255.0f alpha:1.0];
    self.layer.cornerRadius = 5.0f;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 0.7f;
    
    self.blueGradient = [CAGradientLayer layer];
    blueGradient.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:35.0f/255.0f green:77.0f/255.0f blue:159.0f/255.0f alpha:1.0].CGColor,
                            (id)[UIColor colorWithRed:72.0f/255.0f green:132.0f/255.0f blue:232.0f/255.0f alpha:1.0].CGColor, 
                            (id)[UIColor colorWithRed:105.0f/255.0f green:160.0f/255.0f blue:240.0f/255.0f alpha:1.0].CGColor, nil];
    blueGradient.locations = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0.0], [NSNumber numberWithDouble:0.5], [NSNumber numberWithDouble:1.0], nil];  
    blueGradient.frame = CGRectMake(0, 0, 60, 27);
    blueGradient.cornerRadius = 5.0f;    
    
    self.whiteGradient = [CAGradientLayer layer];
    whiteGradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithRed:187.0f/255.0f green:187.0f/255.0f blue:187.0f/255.0f alpha:1.0].CGColor,
                           (id)[UIColor colorWithRed:254.0f/255.0f green:254.0f/255.0f blue:254.0f/255.0f alpha:1.0].CGColor, 
                           (id)[UIColor colorWithRed:254.0f/255.0f green:254.0f/255.0f blue:254.0f/255.0f alpha:1.0].CGColor, nil];
    whiteGradient.locations = [NSArray arrayWithObjects:[NSNumber numberWithDouble:0.0], [NSNumber numberWithDouble:0.5], [NSNumber numberWithDouble:1.0], nil];  
    whiteGradient.frame = CGRectMake(0, 0, 94, 27);      
    whiteGradient.cornerRadius = 5.0f;    
    [self.layer insertSublayer:whiteGradient atIndex:0];
    
    self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(47, 0, 40, 27)];
    self.rightLabel.backgroundColor = [UIColor clearColor];
    self.rightLabel.textColor = [UIColor colorWithRed:110.0f/255.0f green:110.0f/255.0f blue:110.0f/255.0f alpha:1.0];
    self.rightLabel.textAlignment = UITextAlignmentCenter;
    self.rightLabel.font = [UIFont boldSystemFontOfSize:16];
    self.rightLabel.text = @"OFF";
    [self addSubview:rightLabel];
    
    self.slideBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 148, 27)];    
    self.leftBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 54, 27)];
    [leftBg.layer insertSublayer:blueGradient atIndex:0];    
            
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 54, 27)];
    self.leftLabel.backgroundColor = [UIColor clearColor];
    self.leftLabel.textColor = [UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1.0];
    self.leftLabel.textAlignment = UITextAlignmentCenter;
    self.leftLabel.font = [UIFont boldSystemFontOfSize:16];
    self.leftLabel.text = @"ON";
    self.leftLabel.layer.shadowColor = [[UIColor colorWithRed:1.0f/255.0f green:1.0f/255.0f blue:1.0f/255.0f alpha:1.0] CGColor];
    self.leftLabel.layer.shadowOpacity = 0.2;
    [leftBg addSubview:leftLabel];
    [self addSubview:self.leftBg];
    
    self.slider = [[UIView alloc] initWithFrame:CGRectMake(54, 0, 40, 27)];
    self.slider.backgroundColor = [UIColor grayColor];
    self.slider.layer.cornerRadius = 5.0f;
    CAGradientLayer *sliderGradient = [CAGradientLayer layer];
    UIColor *colorOne		= [UIColor colorWithHue:0.625 saturation:0.0 brightness:1.0 alpha:1.0];
		UIColor *colorTwo 	= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.92 alpha:1.0];
		UIColor *colorThree	= [UIColor colorWithHue:0.625 saturation:0.0 brightness:0.76 alpha:1.0];    
		NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, nil];    
                    
    sliderGradient.colors = colors;
    sliderGradient.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.35], [NSNumber numberWithFloat:0.98], [NSNumber numberWithFloat:1.0], nil];
    sliderGradient.frame = CGRectMake(0, 0, 40, 27);      
    sliderGradient.cornerRadius = 5.0f;
    [slider.layer insertSublayer:sliderGradient atIndex:0];
    slider.layer.borderColor = borderColor.CGColor;
    slider.layer.borderWidth = 0.7f;
        
    [self.slideBg addSubview:slider];        
    [self addSubview:slideBg];
    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];;
    [self addGestureRecognizer:tapRecognizer];
    
    rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];    
    rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:rightSwipeRecognizer];
    
    leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:leftSwipeRecognizer];
    
    self.isOn = YES;
  }
  return self;
}

- (void) handleTapFrom:(UITapGestureRecognizer *)recognizer {  
  BOOL on = self.slideBg.frame.origin.x == 0;
  [self updateState:on animated:YES];
}

- (void) handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
  BOOL on = self.slideBg.frame.origin.x == 0;
  
  if(UISwipeGestureRecognizerDirectionRight == recognizer.direction) {
    if(!on) {
      [self updateState:on animated:YES];
    }
  }
  
  if(UISwipeGestureRecognizerDirectionLeft == recognizer.direction) {    
    if(on) {
      [self updateState:on animated:YES];
    }
  }    
}

- (void) updateState:(BOOL)on animated:(BOOL)animated {  
  if(animated) {
    [UIView animateWithDuration:0.2 animations:^{    
      if(on) {
        [self switchOff];
      } else {
        [self switchOn];
      }    
    }];
  } else {
    if(on) {
      [self switchOff];
    } else {
      [self switchOn];
    }
  }  
  
  if(on) {    
    self.isOn = NO;    
  } else {    
    self.isOn = YES;
  }
  
  if (self.delegate != NULL && [self.delegate respondsToSelector:@selector(valueChanged:)]) {
		[self.delegate valueChanged:!on];
	}
}

- (void) switchOff {
  // right to left
  self.slideBg.frame = CGRectMake(-54, 0, self.slider.frame.size.width, self.slider.frame.size.height);
  self.blueGradient.frame = CGRectMake(0, 0, 40, 27);
  self.leftBg.frame = CGRectMake(0, 0, 40, 27);
}

- (void) switchOn {
  // left to right
  self.slideBg.frame = CGRectMake(0, 0, self.slider.frame.size.width, self.slider.frame.size.height);      
  self.blueGradient.frame = CGRectMake(0, 0, 60, 27);
  self.leftBg.frame = CGRectMake(0, 0, 54, 27);
}


- (void) setLeftLabelText: (NSString *) labelText {
  self.leftLabel.text = labelText;
}

- (void) setRightLabelText: (NSString *) labelText {
  self.rightLabel.text = labelText;
}

- (void) setOn:(BOOL) value {
  [self updateState:!value animated:NO];
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
  [slideBg release];
  [leftBg release];
  [rightBg release];
  [slider release];
  [rightLabel release];
  [leftLabel release];
  [tapRecognizer release];
  [rightSwipeRecognizer release];
  [leftSwipeRecognizer release];  
  [blueGradient release];
  [whiteGradient release];
  self.delegate = nil;
  [super dealloc];  
}

@end
