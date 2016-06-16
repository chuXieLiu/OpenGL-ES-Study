//
//  CXGLView.m
//  GL_01
//
//  Created by zj－db0549 on 16/6/16.
//  Copyright © 2016年 MT. All rights reserved.
//

#import "CXGLView.h"
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>

@interface CXGLView () {
    CAEAGLLayer *_eaglLayer;
    EAGLContext *_context;
    GLuint _colorRenderBuffer;
    GLuint _frameBuffer;
}

@end

@implementation CXGLView

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

#pragma mark - private method

- (void)setupLayer {
    _eaglLayer = (CAEAGLLayer *)self.layer;
    
    _eaglLayer.opaque = YES;
    
    _eaglLayer.drawableProperties = @{
                                      kEAGLDrawablePropertyRetainedBacking : @(NO),
                                      kEAGLDrawablePropertyColorFormat : kEAGLColorFormatRGBA8
                                      };
}

- (void)setupContext {
    _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    if (!_context) {
        return;
    }
    [EAGLContext setCurrentContext:_context];
}

- (void)setupRenderBuffer {
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
}










@end
