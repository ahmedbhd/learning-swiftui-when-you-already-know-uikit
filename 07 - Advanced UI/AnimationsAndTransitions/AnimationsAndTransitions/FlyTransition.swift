//
//  FlyTransition.swift
//  AnimationsAndTransitions
//
//  Created by Vincent on 11/05/2023.
//

import SwiftUI

extension AnyTransition {
    static var fly: AnyTransition {
        AnyTransition.modifier(
            active: FlyTransition(percentage: 0),
            identity: FlyTransition(percentage: 1)
        )
    }
}

struct FlyTransition: GeometryEffect {
    var percentage: Double
    
    var animatableData: Double {
        get { percentage }
        set { percentage = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {

        let rotationPercent = percentage
        let a = CGFloat(Angle(degrees: 90 * (1-rotationPercent)).radians)
        
        var transform3d = CATransform3DIdentity;
        transform3d.m34 = -1/max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, a, 1, 0, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform1 = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        let affineTransform2 = ProjectionTransform(CGAffineTransform(scaleX: CGFloat(percentage * 2), y: CGFloat(percentage * 2)))
        
        if percentage <= 0.5 {
            return ProjectionTransform(transform3d).concatenating(affineTransform2).concatenating(affineTransform1)
        } else {
            return ProjectionTransform(transform3d).concatenating(affineTransform1)
        }
    }
}
