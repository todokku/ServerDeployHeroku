import Vapor
import Leaf
import FluentPostgreSQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register routes to the router
    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    let leafProvider = LeafProvider()
    try services.register(leafProvider)
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)

    try services.register(FluentPostgreSQLProvider())
    let postgresqlConfig = PostgreSQLDatabaseConfig(
        hostname: "127.0.0.1",
        port: 5432,
        username: "brazilec22",
        database: "mycooldb",
        password: nil

    )
    services.register(postgresqlConfig)
    var postgres = PostgreSQLDatabase(config : postgresqlConfig)
    var databases = DatabasesConfig()
    databases.add(database: postgres, as: .psql)
    var migrations = MigrationConfig()
  
    migrations.add(model: User.self, database: .psql)
    //migrations.add(model: User.self, database: .psql)
    services.register(migrations)
    //var migrations = MigrationConfig()
    //migrations.add(model: User.self, database: .psql)
    //services.register(migrations)
    //services.register(router, as: Router.self)
    //services.register(NIOServerConfig.default(hostname: "0.0.0.0"))

    //let myService = NIOServerConfig.default(port: 8001)
    //services.register(myService)
}

