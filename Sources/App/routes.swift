import Vapor
import Fluent

func routes(_ app: Application) throws {
    app.get("") { (req) -> String in
        let sessionKey = "the-key"
        let savedSession = req.session.data[sessionKey]
        if let savedSession = savedSession {
            return "Stored session value was \(savedSession)"
        } else {
            req.session.data[sessionKey] = "the-value"
            return "No stored session found. Saving it now."
        }
    }
}
