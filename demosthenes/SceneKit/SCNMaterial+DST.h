//
//  SCNMaterial+DST.h
//  demosthenes
//
//  Created by Ben Guo on 10/7/14.
//  Copyright (c) 2014 bguo. All rights reserved.
//
@import SceneKit;

@interface SCNMaterial (DST)

+ (SCNMaterial *)materialWithCubeMap:(NSString *)cubeMap transparency:(CGFloat)transparency;

@end
