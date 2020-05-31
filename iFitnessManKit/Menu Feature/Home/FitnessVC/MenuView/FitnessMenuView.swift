//
//  FitnessMenuView.swift
//  iHealthS
//
//  Created by Apple on 2019/4/3.
//  Copyright © 2019年 whitelok.com. All rights reserved.
//

import UIKit

class FitnessMenuView: UIView {
    
    var type: FitnessType!
    var image: UIImageView!
    
    var onTapView: ((_ view: FitnessMenuView) -> Void)?
    
    init(frame: CGRect, type: FitnessType) {
        super.init(frame: frame)
        self.type = type
        switch type {
        case .Elementary:
            image = UIImageView(image: UIImage(named: "fit_Elementary.png"))
        case .Intermediate:
            image = UIImageView(image: UIImage(named: "fit_Intermediate.png"))
        case .Advanced:
            image = UIImageView(image: UIImage(named: "fit_Advanced_\(Int(truncating: NSNumber(value: FitnessAction.isPay))).png"))
        }
        
        self.addBackground(image, .scaleAspectFit)
        let tapRecog = UITapGestureRecognizer(target: self, action: #selector(tapViewAction))
        self.addGestureRecognizer(tapRecog)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetBackground(_ imageName: String) {
//        image.removeFromSuperview()
        image.image = UIImage(named: imageName)
//        self.addBackground(image, .scaleAspectFit)
//        self.reloadInputViews()
    }
    
    @objc func tapViewAction(gestureReconizer:UITapGestureRecognizer) {
        if gestureReconizer.state == .ended {
            if let closure = onTapView {
                closure(self)
            }
        }
    }
    
    
    
}
