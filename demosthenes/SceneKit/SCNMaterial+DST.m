//
//  SCNMaterial+DST.m
//  demosthenes
//
//  Created by Ben Guo on 10/7/14.
//  Copyright (c) 2014 bguo. All rights reserved.
//

#import "SCNMaterial+DST.h"

@implementation SCNMaterial (DST)

+ (SCNMaterial *)materialWithCubeMap:(NSString *)name transparency:(CGFloat)transparency
{
    SCNMaterial *material = [[SCNMaterial alloc] init];
    NSString *right = [NSString stringWithFormat:@"%@_right", name];
    NSString *left = [NSString stringWithFormat:@"%@_left", name];
    NSString *top = [NSString stringWithFormat:@"%@_top", name];
    NSString *front = [NSString stringWithFormat:@"%@_front", name];
    NSString *back = [NSString stringWithFormat:@"%@_back", name];
    NSArray *cubeMap = @[
                         [NSImage imageNamed:right],
                         [NSImage imageNamed:left],
                         [NSImage imageNamed:top],
                         [NSImage imageNamed:top],
                         [NSImage imageNamed:front],
                         [NSImage imageNamed:back]
                         ];
    material.reflective.contents = cubeMap;
    material.diffuse.contents = [NSColor blackColor];
    material.specular.contents = [NSColor whiteColor];
    material.shininess = 100;
    material.transparency = transparency;
    return material;
}

@end
