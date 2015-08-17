//
//  ViewController.m
//  VolumeIOSUnity
//
//  Created by Bruno on 14/08/15.
//  Copyright (c) 2015 Bruno. All rights reserved.
//

#import "ViewController.h"
#import  <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController
{
    AVAudioSession* audioSession;
}
- (void)viewWillAppear:(BOOL)animated {
    
    audioSession = [AVAudioSession sharedInstance];
    
    [audioSession setActive:YES error:nil];
    [audioSession addObserver:self forKeyPath:@"outputVolume" options:0 context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqual:@"outputVolume"]) {
        NSLog(@"%f",audioSession.outputVolume);
    }
}

@end
