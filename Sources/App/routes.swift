import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // Dynamic route parameters
    app.get("hello", ":name") { req async throws -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.badRequest)
        }
        return "Hello, \(name)!"
    }

    // Multiple parameters
    app.get("sum", ":x", ":y") { req async throws -> String in
        // Strong typed route parameters (casting)
        guard let x = req.parameters.get("x", as: Int.self) else {
            throw Abort(.badRequest)
        }
        guard let y = req.parameters.get("y", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(x) + \(y) = \(x + y)"
    }

    app.get("movies") { req async in
        [
            Movie(title: "Batman", year: 2022),
            Movie(title: "Superman", year: 2021),
            Movie(title: "Spiderman", year: 2023)
        ]
    }

    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        return movie
    }
}
