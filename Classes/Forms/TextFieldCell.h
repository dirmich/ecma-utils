#import "TitledFormCell.h"
#import "ForwardingLabel.h"

@interface TextFieldCell : TitledFormCell<UITextFieldDelegate> {
	UITextField *value;
    NSInvocation *returnKeyAction;
}
@property (readonly) UITextField *value;

- (void)edit;
@end
