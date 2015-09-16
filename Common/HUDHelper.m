

#import "HUDHelper.h"

@implementation HUDHelper

+ (instancetype)sharedInstance
{
    static id SharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (SharedInstance == nil) {
            SharedInstance = [[self alloc] init];
        }
    });
    return SharedInstance;
}

- (void)dealloc
{
    _window = nil;
    _showingHUDs = nil;
    _loadingHud = nil;
}

- (id)init
{
    if (self = [super init])
    {
        self.window = [AppDelegate getAppDelegate].window;
        _showingHUDs = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void)hudWasHidden:(MBProgressHUD *)hud
{
    @synchronized(_loadingHud)
    {
        if (_loadingHud == hud) {
            [_loadingHud removeFromSuperview];
            [self removeHUD:_loadingHud];
            _loadingHud = nil;
        }
    }
    
}

- (void)addHUD:(MBProgressHUD *)hud
{
    @synchronized(_showingHUDs)
    {
        [_showingHUDs addObject:hud];
    }
}
- (void)removeHUD:(MBProgressHUD *)hud
{
    @synchronized(_showingHUDs)
    {
        [_showingHUDs removeObject:hud];
    }
}

- (void)serviceLoading:(NSInteger)maxRequestCount
{
    @synchronized(_loadingHud)
    {
        if (_loadingHud == nil) {
            _loadingHud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            _loadingHud.delegate = self;
            _loadingHud.tag = 0;
            [self addHUD:_loadingHud];
            [_loadingHud show:YES];
        }
        if (_loadingHud)
        {
            
            _loadingHud.tag++;
        }
    }
}

- (void)loadingWithView:(UIView *)view{
    @synchronized(_loadingHud)
    {
        if (_loadingHud == nil) {
            _loadingHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
            _loadingHud.delegate = self;
            _loadingHud.tag = 0;
            [self addHUD:_loadingHud];
            [_loadingHud show:YES];
            [_loadingHud hide:YES afterDelay:100];
        }
        if (_loadingHud)
        {
            
            _loadingHud.tag++;
        }
    }
}

- (void)loading
{
    @synchronized(_loadingHud)
    {
        if (_loadingHud == nil) {
            _loadingHud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            _loadingHud.delegate = self;
            _loadingHud.tag = 0;
            [self addHUD:_loadingHud];
            _loadingHud.labelText = @"加载中...";
            [_loadingHud show:YES];
            [_loadingHud hide:YES afterDelay:100];
        }
        if (_loadingHud)
        {
            
            _loadingHud.tag++;
        }
    }
}

- (void)stopLoading
{
    @synchronized(_loadingHud)
    {
        if (_loadingHud)
        {
            if (--_loadingHud.tag <= 0)
            {
                [_loadingHud hide:YES];
            }
            
        }
    }
}

- (void)tipMessage:(NSString *)msg delay:(CGFloat)seconds
{
    if (!msg) {
        return;
    }
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:self.window];
    [self.window addSubview:HUD];
    HUD.mode = MBProgressHUDModeText;
    HUD.delegate = self;
    HUD.labelText = msg;
    [HUD show:YES];
    [HUD hide:YES afterDelay:seconds];
}

- (void)delayTipMessage:(NSString *)msg
{
    [self tipMessage:msg delay:2.0];
}

- (void)tipMessage:(NSString *)msg
{
    if (!msg) {
        return;
    }
    
    if ([NSThread isMainThread])
    {
        [self performSelector:@selector(delayTipMessage:) withObject:msg afterDelay:0.2];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(tipMessage:) withObject:msg waitUntilDone:NO];
    }
    
}


@end
