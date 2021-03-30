//
//  RequestError.swift
//  dartmazing_network
//
//  Created by Hélio Mesquita on 25/03/21.
//

import Foundation

enum RequestError: Int, Equatable {

    typealias RawValue = Int

    case unknownError = 0
    case invalidParser = 1
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404

    var message: String {
        return String(describing: self)
    }
    
    var flutterError: FlutterError {
        return FlutterError(code: "\(self.rawValue)", message: message, details: nil)
    }

}

