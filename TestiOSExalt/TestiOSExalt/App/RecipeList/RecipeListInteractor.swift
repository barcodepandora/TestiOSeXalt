//
//  RecipeListInteractor.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation

protocol RecipeListBusinessLogic {
    func getRecipeList()
    //func getRecipe(user: Recipe.Request)
}

class RecipeListInteractor: RecipeListBusinessLogic {
    var presenter: RecipeListPresenterProtocol!
    
    convenience init(presenter: RecipeListPresenterProtocol) {
        self.init()
        self.getRecipeListUseCase = GetDirectoryUseCase()
        //self.getUserUseCase = GetUserUseCase()
        self.presenter = presenter
    }
    
    var getRecipeListUseCase: GetRecipeListUseCase?
    //var getUserUseCase: GetUserUseCase?
    
    func getRecipeList() {
        getRecipeListUseCase?.fetchRecipeList(completion: { (response) in
            var recipeList: [RecipeList.Response] = []
            for recipe in response {
                recipeList.append(Recipe.Response(id: recipe.id ?? 1, name: recipe.name ?? ""))
            }
            let recipeList = RecipeList.Response(recipeList: recipeList)
            self.presenter.presentRecipeList(recipeList: recipeList)
        })
    }
}
