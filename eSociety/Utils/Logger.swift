//
//  Logger.swift
//  eSociety
//
//  Created by Meheboob on 03/09/25.
//

// MARK: - Logger
/// A helper utility for logging debug messages with file, function, and line info.
/// Automatically disabled in release builds.
struct Logger {
    
    /// Logs a debug message with additional context.
    ///
    /// - Author: Meheboob Nadaf
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file where the log is triggered. Defaults to `#file`.
    ///   - function: The function where the log is triggered. Defaults to `#function`.
    ///   - line: The line number where the log is triggered. Defaults to `#line`.
    /// - Complexity: **O(1)** (string formatting and print are constant time).
    static func debug(_ message: String,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):\(line)] \(function) -> \(message)")
        #endif
    }
}
