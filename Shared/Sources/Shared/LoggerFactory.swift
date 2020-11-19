import Logging

public final class LoggerFactory {
    // https://nshipster.com/swift-log/
    public static func defaultLogger(_ label:String = "cl.mobdev.iOS.main") -> Logger {
        var logger = Logger(label: label)
        
        logger.logLevel = .warning
        
        if Environment.shared.isDebug() {
            logger.logLevel = .trace
        }
        
        return logger
    }
}
