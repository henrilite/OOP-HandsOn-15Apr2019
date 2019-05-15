//
//  RoundedButton.swift
//  HandsOn-15Apr2019
//
//  Created by Henri Lie Jaya on 15/05/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        backgroundColor = .red
        setTitleColor(.white, for: .normal)
    }
  

}
