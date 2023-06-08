//
//  RecipeList.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation

enum RecipeList {
    struct Response {
        var recipeList: [Recipe.Response]
    }
    
    struct ViewModel {
        var directory: [Recipe.ViewModel]
    }
}
