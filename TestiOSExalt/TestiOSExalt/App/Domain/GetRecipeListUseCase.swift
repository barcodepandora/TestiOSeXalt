//
//  GetRecipeListUseCase.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation
import Alamofire

protocol GetRecipeListUseCaseProtocol {
    func fetchRecipeList(completion: @escaping ([RecipeDecodable]) -> Void)
}

class GetRecipeListUseCase: GetRecipeListUseCaseProtocol {
    func fetchRecipeList(completion: @escaping ([RecipeDecodable]) -> Void) {
        if APIClient.isAPIAccesible() {
            
//            APIClient.returnAfterDecode()
            
//            APIClient.returnDirectory(completion: { response in
//                completion(self.returnDirectory(response: response))
//            })
            
            completion(APIClient.returnRecipeList(completion: <#T##(AFDataResponse<[RecipeDecodable]>) -> Void#>, ))
        }
    }
}
