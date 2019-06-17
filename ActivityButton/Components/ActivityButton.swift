//
//  ActivityButton.swift
//  ActivityButton
//
//  Created by 李宗良 on 2019/6/17.
//  Copyright © 2019 andrew. All rights reserved.
//

import UIKit

/// A button with UIActivityIndicatorView.
/// If this button has image, UIActivityIndicatorView will be the same frame with imageView, and hide imageView when UIActivityIndicatorView showing.
/// If only has text, UIActivityIndicatorView will be the same center with textLabel, and hide imageView when UIActivityIndicatorView showing.
public class ActivityButton: UIButton {
    
    var hasImage: Bool = false
    
    /// UIActivityIndicatorView default size, it is from system.
    let activityViewDefaultSize: CGFloat = 21
    
    lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.isUserInteractionEnabled = false
        view.hidesWhenStopped = true
        view.stopAnimating()
        view.tintColor = activityColor ?? tintColor
        self.addSubview(view)
        return view
    }()
    
    /// UIActivityIndicatorView tint color, if this value is nil, the default tint color will be same with button.
    @objc public var activityColor: UIColor? {
        didSet {
            activityView.tintColor = activityColor
        }
    }
    
    @objc public var showActivity: Bool = false {
        didSet {
            if showActivity {
                activityView.startAnimating()
            } else {
                activityView.stopAnimating()
            }
            isEnabled = !showActivity
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            if activityColor == nil {
                activityView.tintColor = tintColor
            }
        }
    }
    
    override public func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        var rect = super.imageRect(forContentRect: contentRect)
        hasImage = !rect.isEmpty
        if hasImage, showActivity {
            activityView.center = CGPoint(x: rect.midX, y: rect.midY)
            let scale = rect.width / activityViewDefaultSize
            activityView.transform = CGAffineTransform(scaleX: scale, y: scale)
            
            rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        return rect
    }
    
    override public func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.titleRect(forContentRect: contentRect)
        if !hasImage, showActivity {
            let center = CGPoint(x: rect.midX, y: rect.midY)
            activityView.center = center
            activityView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        return rect
    }
}
