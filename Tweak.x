#import <UIKit/UIKit.h>

@interface SBIcon : NSObject
- (NSString *)applicationBundleID;
@end

@interface SBIconImageView : UIView
@property (nonatomic, retain) SBIcon *icon;
- (void)setContentsImage:(UIImage *)image;
@end

%hook SBIconImageView

- (void)updateImageAnimated:(BOOL)animated {
    %orig;
    
    SBIcon *icon = [self icon];
    if ([icon respondsToSelector:@selector(applicationBundleID)]) {
        NSString *bundleID = [icon applicationBundleID];
        
        if (bundleID) {
            NSString *themePath = [NSString stringWithFormat:@"/var/mobile/Library/Themes/CustomIcons/%@.png", bundleID];
            UIImage *customIcon = [UIImage imageWithContentsOfFile:themePath];
            
            if (customIcon) {
                [self setContentsImage:customIcon];
            }
        }
    }
}

%end
