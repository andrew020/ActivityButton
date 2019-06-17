//
//  ActivityButton_Reactive.swift
//  ActivityButton
//
//  Created by 李宗良 on 2019/6/17.
//  Copyright © 2019 andrew. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

extension Reactive where Base : ActivityButton {
    public var showActivity: BindingTarget<Bool> {
        return makeBindingTarget { $0.showActivity = $1 }
    }
}
