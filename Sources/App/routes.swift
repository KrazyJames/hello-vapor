import Vapor

func routes(_ app: Application) throws {
    let movies = app.grouped("movies")
    let users = app.grouped("users")

    // MARK: - Movies
    movies.get { req async in
        [Movie(title: "Batman", year: 2021)]
    }

    movies.get(":id") { req async throws in
        guard let id = req.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return Movie(title: "Superman \(id)", year: 2020)
    }

    // MARK: - Users
    users.get("premium") { req async throws in
        return "Premium"
    }
}
