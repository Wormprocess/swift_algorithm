//
//  ChartsView.swift
//  algorithm
//
//  Created by Hello on 2019/4/9.
//  Copyright © 2019 Hello. All rights reserved.
//

import UIKit

class ChartsView: UIView {

    var data : [NSInteger]?
    var dataViews : [CALayer] = Array.init()
    
    @objc public init(_ frame:CGRect, _ data: [NSInteger],title: String) {
        super.init(frame: frame)
        self.data = data
        self.backgroundColor = UIColor.init(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1)
        
        let space: CGFloat = 10.0;
        let width = (self.frame.size.width - space) / CGFloat(data.count) - space;
        
        for i in 0..<data.count {
            let layer = CALayer.init()
            let height = CGFloat(data[i])/100 * self.frame.size.height
            
            layer.frame = CGRect.init(x: space + (space + width) * CGFloat(i), y: self.frame.size.height - height + 2, width: width, height: height);
            layer.backgroundColor = UIColor.cyan.cgColor
            self.layer.addSublayer(layer);
            self.dataViews.append(layer)
        }
        
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: 100, height: 20));
        label.text = title
        label.textColor = UIColor.red
        self.addSubview(label);
    }
    
    func animation(left: NSInteger ,right: NSInteger)  {
        
        DispatchQueue.main.sync {
        
            let leftLayer = self.dataViews[left];
            let rightLayer = self.dataViews[right];
        
            self.dataViews[left] = rightLayer;
            self.dataViews[right] = leftLayer;
        
            var leftrect = leftLayer.frame
            var rightrect = rightLayer.frame

            leftrect.origin.x = rightLayer.frame.origin.x
            rightrect.origin.x = leftLayer.frame.origin.x

            leftLayer.frame = leftrect
            rightLayer.frame = rightrect;
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
