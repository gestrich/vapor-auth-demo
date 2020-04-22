import Vapor
import Fluent
import FluentSQLiteDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    app.sessions.use(.fluent)
    app.middleware.use(app.sessions.middleware)
    app.migrations.add(SessionRecord.migration)
    try app.autoMigrate().wait()
}
