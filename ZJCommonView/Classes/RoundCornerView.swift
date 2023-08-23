//
//  File.swift
//  ZJCommonView
//
//  Created by Jercan on 2023/8/23.
//

import UIKit

public class RoundCornerView: UIView {
    
    let radius: CGFloat
    
    var corners: UIRectCorner? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    init(radius: CGFloat) {
        self.radius = radius
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        guard let rectCorner = corners else { return }
        addRoundCorners(rect: bounds, corners: rectCorner, radius: radius)
    }
    
    private func addRoundCorners(rect: CGRect, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = path.cgPath

        layer.mask = maskLayer
    }
    
}



