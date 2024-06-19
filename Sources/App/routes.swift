import Vapor

func routes(_ app: Application) throws {
    app.middleware.use(LogMiddleware())
    app.middleware.use(AuthMiddleware())
    try app.register(collection: MovieController())
}
