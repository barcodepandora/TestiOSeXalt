//
//  APIRouter.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case returnRecipeList(apikey: String)
    
    // MARK: - URL
    private var path: String {
        switch self {
        case .returnRecipeList:
            return "/recipes/complexSearch"
        }
    }

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .returnRecipeList:
            return .get
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .returnRecipeList(let apikey):
            return ["apiKey": apikey]
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try "https://api.spoonacular.com/".asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return URLRequest(url: url)
    }
}
