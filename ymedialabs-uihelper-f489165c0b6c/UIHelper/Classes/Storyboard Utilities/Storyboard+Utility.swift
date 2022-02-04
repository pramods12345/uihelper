//
//  Storyboard+Utility.swift
//  Copyright © 2017 YmedilaLabs. All rights reserved.
//

import UIKit

/// The uniform place where we state all the storyboard we have in our application
/// TODO: These are examples, add based on your projects
//public enum Storyboard : String {
//    case account = "Account"
//    case map = "Map"
//    case baseContainer = "BaseContainer"
//    case launch = "Launch"
//    case touchPointDetails = "TouchPointDetails"
//    
//}

/// Use this class to load storyboard with identifier.
/// Note: Class name identifier has to be same
/// Example
///     let storyboard = UIStoryboard(storyboard: .Post)
///     let viewController: PostViewController = storyboard.instantiateViewController()

public extension UIStoryboard {
    
    /// Convenience Initializers
    
    convenience init(storyboard: String, bundle: Bundle? = nil) {
        self.init(name: storyboard, bundle: bundle)
    }
    
    
    /// Class Functions
    
    class func storyboard(_ storyboard: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard, bundle: bundle)
    }
    
    
    /// View Controller Instantiation from Generics
    /// New Way
    public func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
