//
//  StoryboardIdentifier.swift
//  Watani
//  Copyright © 2017 Y Media Labs. All rights reserved.
//

import UIKit

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

public extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
