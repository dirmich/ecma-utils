#import "UIBlocker.h"


@implementation UIBlocker

@synthesize views;
@synthesize indicator;
@synthesize blockInteraction;


+ (UIBlocker*)blocker {
	return [[self new] autorelease];
}


+ (UIBlocker*)blockerForView:(UIView*)view {
	UIBlocker *blocker = [self blocker];
	blocker.views = [NSArray arrayWithObject:view];
	return blocker;
}

-(void)dontShowIndicator{
	dontShowIndicator = YES;
}


- (void)dealloc {
	[indicator release];
    [myIndicator release];
	[views release];
	[viewStates release];
	[super dealloc];
}

#pragma mark UIBlockingView

- (void)blockUI {
    [viewStates autorelease];
	viewStates = [NSMutableDictionary new];

	for (UIView *view in views) {
		[viewStates setObject:[NSNumber numberWithBool:view.userInteractionEnabled] forKey:[NSNumber numberWithUnsignedInt:view.hash]];
		view.userInteractionEnabled = NO;
	}

    if (blockInteraction) {
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    }
}


- (void)unblockUI {
	for (UIView *view in views) {
		view.userInteractionEnabled = [[viewStates objectForKey:[NSNumber numberWithUnsignedInt:view.hash]] boolValue];
	}
	[viewStates release];
    viewStates = nil;
	
	[indicator stopAnimating];
    [myIndicator stopAnimating];
    [myIndicator removeFromSuperview];

    if (blockInteraction) {
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    }
}


- (void)showIndicator {
    UIActivityIndicatorView *activeIndicator = self.indicator;
    if (!(activeIndicator || dontShowIndicator)) {
        if (!myIndicator) {
            myIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
            myIndicator.hidesWhenStopped = YES;
        }
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:myIndicator];
        myIndicator.center = window.center;
        activeIndicator = myIndicator;
    }
	activeIndicator.hidden = NO;
	[activeIndicator startAnimating];
}

@end