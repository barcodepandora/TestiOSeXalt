//
//  APIClient.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation
import Alamofire

class APIClient {
    static func returnRecipeList(completion: @escaping (AFDataResponse<[RecipeDecodable]>) -> Void) {
        AF.request(APIRouter.returnRecipeList(apikey: "f4a136efeb214d70a875a56f418b162e"))
            .responseDecodable(of: [RecipeDecodable].self) { (response: AFDataResponse<[RecipeDecodable]>) in
                debugPrint(response)
                let jsonData = response.data!
                do {
                    let decodables = try JSONDecoder().decode([RecipeDecodable].self, from: jsonData)
                    print(decodables)
                    //            return decodables.data!
                } catch {
                    print (error)
                }
                
                completion (response) }
    }

    static func isAPIAccesible() -> Bool {
        return true
    }
}
