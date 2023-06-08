//
//  RecipeListPresenter.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation

protocol RecipeListPresenterProtocol {
    func presentRecipeList(recipeList: RecipeList.Response)
    func presentRecipe(recipe: Recipe.Response)
}

class RecipeListPresenter: RecipeListPresenterProtocol {
    var vc: RecipeListDisplayProtocol!
    
    convenience init(vc: RecipeListDisplayProtocol) {
        self.init()
        self.vc = vc
    }
    
    func presentRecipeList(recipeList: RecipeList.Response) {
        let recipeList = RecipeList.ViewModel(recipeList: self.getViewModelFromResponse(directory: recipeList))
        self.vc.displayRecipeList(recipeList: recipeList)
    }
    
    func getViewModelFromResponse(directory: Directory.Response) -> [User.ViewModel] {
        var recipeList: [Recipe.ViewModel] = []
        for recipe in recipeList.directory {
            recipeList.append(User.ViewModel(id: recipe.id, name: recipe.name))
        }
        return users
    }
    
    func presentRecipe(recipe: Recipe.Response) {
        let recipe = Recipe.ViewModel(id: recipe.id, name: recipe.name)
        self.vc.displayUser(user: user)
    }
    
}
