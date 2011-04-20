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

//  PCCustomSwitch.h


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol PCCustomSwitchDelegate <NSObject>

- (void) valueChanged:(BOOL)value;

@end


@interface PCCustomSwitch : UIView {
  UIView *slideBg;
  UIView *leftBg;
  UIView *rightBg;
  UIView *slider;
  UILabel *rightLabel;
  UILabel *leftLabel;
  BOOL isOn;
  CAGradientLayer *blueGradient;
  CAGradientLayer *whiteGradient;
  UITapGestureRecognizer *tapRecognizer;
  UISwipeGestureRecognizer *rightSwipeRecognizer;
  UISwipeGestureRecognizer *leftSwipeRecognizer;
  id <PCCustomSwitchDelegate> delegate;
}

@property (retain) UIView *slideBg;
@property (retain) UIView *leftBg;
@property (retain) UIView *rightBg;
@property (retain) UIView *slider;
@property (retain) UILabel *rightLabel;
@property (retain) UILabel *leftLabel;
@property (retain) UITapGestureRecognizer *tapRecognizer;
@property (retain) UISwipeGestureRecognizer *rightSwipeRecognizer;
@property (retain) UISwipeGestureRecognizer *leftSwipeRecognizer;
@property (retain) CAGradientLayer *blueGradient;
@property (retain) CAGradientLayer *whiteGradient;
@property (assign) id <PCCustomSwitchDelegate> delegate;
@property (assign) BOOL isOn;

- (void) updateState:(BOOL)on animated:(BOOL)animated;
- (void) switchOff;
- (void) switchOn;
- (void) setLeftLabelText: (NSString *) labelText;
- (void) setRightLabelText: (NSString *) labelText;
- (void) setOn:(BOOL) value;

@end
