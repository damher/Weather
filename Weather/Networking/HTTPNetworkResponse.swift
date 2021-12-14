//
//  HTTPNetworkResponse.swift
//  Weather
//
//  Created by Mher Davtyan on 12.12.21.
//

import Foundation

struct HTTPNetworkResponse {
    
    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<String>{
        
        guard let res = response else { return Result.failure(HTTPNetworkError.unwrappingError) }
        
        switch res.statusCode {
        case 200...299: return .success(HTTPNetworkError.success.rawValue)
        case 401: return .failure(HTTPNetworkError.authenticationError)
        case 400...499: return .failure(HTTPNetworkError.badRequest)
        case 500...599: return .failure(HTTPNetworkError.serverSideError)
        default: return .failure(HTTPNetworkError.failed)
        }
    }
}
