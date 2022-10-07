//
//  ColorButton.swift
//  DrawingApp
//
//  Created by Hannah Chen on 10/7/22.
//

import UIKit


//Reference: https://stackoverflow.com/questions/46256623/apply-custom-uibutton-styling-to-all-buttons
class ColorButton : UIButton {

   override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
      }

   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
      }

   private func setup() {
       self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
  }

}
