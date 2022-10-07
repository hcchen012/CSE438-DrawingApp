//
//  SolidShape.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/7/22.
//

import UIKit

class SolidShape: Shape {
    
    override func draw() {
//        fatalError("IMPLEMENT THIS")
        print("solid draw called")

        color.setFill()
        path.fill(with: CGBlendMode.normal, alpha: alphaVal)
    }


}
