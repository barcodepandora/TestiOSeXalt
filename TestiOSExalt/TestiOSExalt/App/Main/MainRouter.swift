//
//  MainRouter.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    func routeToList(source: UIViewController)
}

class MainRouter: MainRouterProtocol {
    
    func routeToRecipeList(source: UIViewController) {
        navigateToRecipeList(source: source, destination: RecipeListViewController())

    }
    
    // MARK: Navigation
    
    func navigateToRecipeList(source: UIViewController, destination: RecipeListDisplayProtocol) {
        source.show(RecipeListViewController(), sender: self)
    }

    /*
     
     */
}
