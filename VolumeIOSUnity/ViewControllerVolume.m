//
//  ViewControllerVolume.m
//  VolumeIOSUnity
//
//  Created by Bruno on 28/08/15.
//  Copyright (c) 2015 Bruno. All rights reserved.
//

#import "ViewControllerVolume.h"

@interface ViewControllerVolume ()

@end

@implementation ViewControllerVolume{
    int flagInteruptVolume;
    NSTimer *timerVolume;
    
    BOOL isDoubleClick;
    NSTimer *doubleClickTimer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:YES error:nil];
    [audioSession addObserver:self forKeyPath:@"outputVolume" options:0 context:nil];
    volumeDevice = 0;
    inputButtonVolume = false;
    flagInteruptVolume = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqual:@"outputVolume"]) {
        volumeDevice = audioSession.outputVolume;
        inputButtonVolume = true;
        [self onTick];
        NSLog(@"%f",volumeDevice);
    }
}
-(void)onTick{
    if (isDoubleClick==YES) {
        //DOUBLE CLICK
        NSLog(@"Double Click");
        isDoubleClick=NO;
    }
    else if(isDoubleClick==NO)
    {
        //SINGLE CLICK
        isDoubleClick=YES;
        doubleClickTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(TimerReload:) userInfo:nil repeats:NO];
    }
}

-(void)initTimerVolume{
    flagInteruptVolume = 0;
//    [timerVolume  invalidate];
}

-(float) getVolumeDevice{
    return volumeDevice;
}

-(float) getInputButtonVolume{
    return inputButtonVolume;
}

-(void) setInputButtonVolumeFalse{
     inputButtonVolume=false;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//Pragma Mark- Actions
- (IBAction)buttonVolume:(UIButton *)sender {
}
//Pragma Mark - functions
-(void)TimerReload:(NSTimer *)timer
{
    doubleClickTimer = nil;
    isDoubleClick = NO;
}

@end
