//
//  ViewController.m
//  VolumeIOSUnity
//
//  Created by Bruno on 14/08/15.
//  Copyright (c) 2015 Bruno. All rights reserved.
//

#import "PluginIOSVolume.h"

@implementation PluginIOSVolume{

}
- (id)init
{
    self = [super init];
    audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:YES error:nil];
    [audioSession addObserver:self forKeyPath:@"outputVolume" options:0 context:nil];
    volumeDevice = 0;
    return self;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqual:@"outputVolume"]) {
        NSLog(@"%f",audioSession.outputVolume);
        volumeDevice = audioSession.outputVolume;
    }
}

-(float) getVolumeDevice{
    return volumeDevice;
}

@end
static PluginIOSVolume* delegateObject=nil;
extern "C"{
    
    void _StartClass(){
        if(delegateObject == nil){
            delegateObject = [[PluginIOSVolume alloc] init];
        }
    }
    
    
    float _GetVolume(){
        return [delegateObject getVolumeDevice];
    }
}
