//  The MIT License (MIT)
//
//  Copyright (c) 2016 Caleb Kleveter
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

/// Renders Markdown into HTML.
public struct rers {
    public func replace(matchesFor regex: String, in string: String, start: String = "", end: String = "")throws -> String {
        let mutableString = NSMutableString(string: string)
        let regExpression = try NSRegularExpression(pattern: regex, options: .allowCommentsAndWhitespace)
        regExpression.replaceMatches(in: mutableString, options: .anchored, range: NSRange(location: 0, length: mutableString.length), withTemplate: start + "$1" + end)
        return String(mutableString)
    }
    
    public func replaceItalics(from string: String)throws -> String {
        let renderedString = try self.replace(matchesFor: "\\_([^\\_]+)\\_", in: string, start: "<em>", end: "</em>")
        return try self.replace(matchesFor: "\\*([^\\*]+)\\*", in: renderedString, start: "<em>", end: "</em>")
        
    }
    
    public func replaceBold(from string: String)throws -> String {
        let renderedString = try self.replace(matchesFor: "\\_\\_([^\\_\\_]+)\\_\\_", in: string, start: "<strong>", end: "</strong>")
        return try self.replace(matchesFor: "\\*\\*([^\\*\\*]+)\\*\\*", in: renderedString, start: "<strong>", end: "</strong>")
    }
}
