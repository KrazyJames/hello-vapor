//
//  LogMiddleware.swift
//  
//
//  Created by Jimmy on 19/06/24.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        print("LOG MiddleWare")
        return try await next.respond(to: request)
    }
}
