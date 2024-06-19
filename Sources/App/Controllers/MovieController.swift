//
//  MovieController.swift
//
//
//  Created by Jimmy on 19/06/24.
//

import Foundation
import Vapor

struct MovieController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let movies = routes.grouped("movies")
        movies.get(use: index)
        movies.get(":id", use: show)
    }
    
    @Sendable
    func index(req: Request) async throws -> String {
        return "Index"
    }

    @Sendable
    func show(req: Request) async throws -> String {
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(id)"
    }

}
