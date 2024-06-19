//
//  AuthMiddleware.swift
//
//
//  Created by Jimmy on 19/06/24.
//

import Foundation
import Vapor

struct AuthMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        guard let auth = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        print(auth.token)
        return try await next.respond(to: request)
    }
}
