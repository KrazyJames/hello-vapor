@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    var app: Application!
    
    override func setUp() async throws {
        self.app = try await Application.make(.testing)
        try await configure(app)
    }
    
    override func tearDown() async throws { 
        try await self.app.asyncShutdown()
        self.app = nil
    }
    
    func testHelloWorld() async throws {
        try await self.app.test(
            .GET,
            "hello",
            afterResponse: { res async in
                XCTAssertEqual(res.status, .ok)
                XCTAssertEqual(res.body.string, "Hello, world!")
            }
        )
    }

    func testSum() async throws {
        let x = 1
        let y = 2
        try await self.app.test(
            .GET,
            "sum/\(x)/\(y)",
            afterResponse: { res async in
                XCTAssertEqual(res.status, .ok)
                XCTAssertEqual(res.body.string, "\(x) + \(y) = \(x + y)")
            }
        )
    }

    func testSum_no_numbers_should_fail() async throws {
        let x = 1
        let y = "h"
        try await self.app.test(
            .GET,
            "sum/\(x)/\(y)",
            afterResponse: { res async in
                XCTAssertEqual(res.status, .badRequest)
            }
        )
    }
}
