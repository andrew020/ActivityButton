//
//  ActivityButton.swift
//
//  Created by 李宗良 on 2019/5/20.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

public class ActivityButton: UIButton {
    
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
    
    @objc public var activityColor: UIColor? {
        didSet {
            activityView.tintColor = activityColor
        }
    }
    
    var hasImage: Bool = false
    
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


extension Reactive where Base : ActivityButton {
    public var showActivity: BindingTarget<Bool> {
        return makeBindingTarget { $0.showActivity = $1 }
    }
}
