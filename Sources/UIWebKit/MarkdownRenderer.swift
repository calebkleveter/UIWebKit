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
public struct MarkdownRenderer {
    
    /// Replaces the string passed in with the first instance of captured text from the string and adds leading and following text.
    ///
    /// - Parameters:
    ///   - regex: The regex used for matching the text.
    ///   - string: The string that will be matched against the regex.
    ///   - start: The string that will be appended to the start of the resulting string after runnning it through the regex.
    ///   - end: The string that will be appended to the end of the resulting string after running it through the regex.
    /// - Returns: The renderd string.
    /// - Throws: Any errors thrown from creating the regex.
    public func replace(matchesFor regex: String, in string: String, start: String = "", end: String = "")throws -> String {
        let mutableString = NSMutableString(string: string)
        let regExpression = try NSRegularExpression(pattern: regex, options: .allowCommentsAndWhitespace)
        regExpression.replaceMatches(in: mutableString, options: .withoutAnchoringBounds, range: NSRange(location: 0, length: mutableString.length), withTemplate: start + "$1" + end)
        return String(mutableString)
    }
    
    /// Renders Markdown italic syntax to HTML `<em>` tags.
    ///
    /// - Parameter string: The string used to render the HTML.
    /// - Returns: The rendered string.
    /// - Throws: Any errors thrown when creating the regex for finding Markdown italic syntax.
    public func replaceItalics(from string: String)throws -> String {
        let renderedString = try self.replace(matchesFor: "\\_([^\\_]+)\\_", in: string, start: "<em>", end: "</em>")
        return try self.replace(matchesFor: "\\*([^\\*]+)\\*", in: renderedString, start: "<em>", end: "</em>")
        
    }
    
    /// Renders Markdown bold syntax to HTML `<strong>` tags.
    ///
    /// - Parameter string: The string that is used for rendering.
    /// - Returns: The rendered string.
    /// - Throws: Any errors thrown when creating the regex for finding Markdown bold syntax.
    public func replaceBold(from string: String)throws -> String {
        let renderedString = try self.replace(matchesFor: "\\_\\_([^\\_\\_]+)\\_\\_", in: string, start: "<strong>", end: "</strong>")
        return try self.replace(matchesFor: "\\*\\*([^\\*\\*]+)\\*\\*", in: renderedString, start: "<strong>", end: "</strong>")
    }
    
    /// Renders Markdown headers into HTML.
    ///
    /// - Parameter string: The string that is used for rendering.
    /// - Returns: The rendered string.
    /// - Throws: Any errors thrown when creating the regex for finding Markdown headers.
    public func replaceHeaders(from string: String)throws -> String {
        var renderedString = string
        renderedString = try self.replace(matchesFor: "(.+)\\n\\=+", in: renderedString, start: "<h1>", end: "</h1>")
        renderedString = try self.replace(matchesFor: "(.+)\\n\\-+", in: renderedString, start: "<h2>", end: "</h2>")
        renderedString = try self.replace(matchesFor: "\\#([^\\#]+)\\#*", in: renderedString, start: "<h1>", end: "</h1>")
        renderedString = try self.replace(matchesFor: "\\#\\#([^\\#]+)\\#*", in: renderedString, start: "<h2>", end: "</h2>")
        renderedString = try self.replace(matchesFor: "\\#\\#\\#([^\\#]+)\\#*", in: renderedString, start: "<h3>", end: "</h3>")
        renderedString = try self.replace(matchesFor: "\\#\\#\\#\\#([^\\#]+)\\#*", in: renderedString, start: "<h4>", end: "</h4>")
        renderedString = try self.replace(matchesFor: "\\#\\#\\#\\#\\#([^\\#]+)\\#*", in: renderedString, start: "<h5>", end: "</h5>")
        renderedString = try self.replace(matchesFor: "\\#\\#\\#\\#\\#\\#([^\\#]+)\\#*", in: renderedString, start: "<h6>", end: "</h6>")
        return renderedString
    }
    
    /// Renders a Markdown blockquote to an HTML `<blockquote>` element.
    ///
    /// - Parameter string: The string the HTML will be rendered from.
    /// - Returns: The final rendered string.
    /// - Throws: Any error thrown while creating the regex to find blockquotes.
    public func renderBlockQuotes(from string: String)throws -> String {
        var renderedString = string
        renderedString = try self.replace(matchesFor: "\\>\\s?(.*)", in: renderedString, start: "<h1>", end: "</h1>")
        return renderedString
    }
}
