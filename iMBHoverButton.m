/*
 iMedia Browser <http://karelia.com/imedia>
 
 Copyright (c) 2005-2007 by Karelia Software et al.
 
 iMedia Browser is based on code originally developed by Jason Terhorst,
 further developed for Sandvox by Greg Hulands, Dan Wood, and Terrence Talbot.
 Contributions have also been made by Matt Gough, Martin Wennerberg and others
 as indicated in source files.
 
 iMedia Browser is licensed under the following terms:
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in all or substantial portions of the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to permit
 persons to whom the Software is furnished to do so, subject to the following
 conditions:
 
	Redistributions of source code must retain the original terms stated here,
	including this list of conditions, the disclaimer noted below, and the
	following copyright notice: Copyright (c) 2005-2007 by Karelia Software et al.
 
	Redistributions in binary form must include, in an end-user-visible manner,
	e.g., About window, Acknowledgments window, or similar, either a) the original
	terms stated here, including this list of conditions, the disclaimer noted
	below, and the aforementioned copyright notice, or b) the aforementioned
	copyright notice and a link to karelia.com/imedia.
 
	Neither the name of Karelia Software, nor Sandvox, nor the names of
	contributors to iMedia Browser may be used to endorse or promote products
	derived from the Software without prior and express written permission from
	Karelia Software or individual contributors, as appropriate.
 
 Disclaimer: THE SOFTWARE IS PROVIDED BY THE COPYRIGHT OWNER AND CONTRIBUTORS
 "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE,
 AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT, OR OTHERWISE, ARISING FROM, OUT OF, OR IN CONNECTION WITH, THE
 SOFTWARE OR THE USE OF, OR OTHER DEALINGS IN, THE SOFTWARE.
*/


#import "iMBHoverButton.h"

@implementation iMBHoverButton

- (id)initWithFrame:(NSRect)aFrame
{
	if ((self = [super initWithFrame:aFrame]) != nil) {
		iMBHoverButtonCell *theCell = [[[iMBHoverButtonCell allocWithZone:[self zone]] init] autorelease];
		[self setCell:theCell];

		[self setButtonType:NSMomentaryChangeButton];
		[self setShowsBorderOnlyWhileMouseInside:YES];
		[self setBordered:NO];
		[self setTitle:@""];
		[self setImagePosition:NSImageOnly];

		NSString *p  = [[NSBundle bundleForClass:[self class]] pathForResource:@"i" ofType:@"tiff"];
		NSString *p2 = [[NSBundle bundleForClass:[self class]] pathForResource:@"i2" ofType:@"tiff"];
		NSImage *im  = [[[NSImage alloc] initWithContentsOfFile:p ] autorelease];
		NSImage *im2 = [[[NSImage alloc] initWithContentsOfFile:p2] autorelease];
		[self setImage:im];
		[self setAlternateImage:im2];
		
		[theCell setImageDimsWhenDisabled:YES];
	}
	return self;
}

@end

@implementation iMBHoverButtonCell

- (void)mouseEntered:(NSEvent *)event
{
	NSImage *image = [[self image] retain];
	NSImage *alternateImage = [[self alternateImage] retain];
	[self setImage:alternateImage];
	[self setAlternateImage:image];
	[image release];
	[alternateImage release];
}

- (void)mouseExited:(NSEvent *)event
{
	NSImage *image = [[self image] retain];
	NSImage *alternateImage = [[self alternateImage] retain];
	[self setImage:alternateImage];
	[self setAlternateImage:image];
	[image release];
	[alternateImage release];
}


@end
