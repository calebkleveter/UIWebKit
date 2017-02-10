//  The MIT License (MIT)
//
//  Copyright (c) 2017 Caleb Kleveter
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

/// Although dependencies use more CSS or JavaScript, this enum is used more for adding the CSS of the dependeny to the head of the page and the below the footer of the page.
///
/// - javaScript: Defines the CDN links of the dependency as linking to JavaScript.
/// - css: Defines the CDN links of the dependency as linking to CSS.
public enum DependancyType {
    case javaScript
    case css
}

/// A dependency that a UIWebPage loads in.
public enum Dependancy {
    
    /// This case is for loading jQuery into a UIWebPage.
    case jQuery
    
    /// This case is used for loading Twitter Bootstrap into a UIWebPage.
    case bootstrap
    
    /// Gets the type of the dependency. This is based off what the dependency uses _mostly_. For example, Twitter Bootstrap is marked as CSS, but it also uses JS.
    public var type: DependancyType {
        switch self {
        case .jQuery: return .javaScript
        case .bootstrap: return .css
        }
    }
    
    /// Returns a a dictionary with the key as the type of CDN links that are used in the value and the value as an array of Strings that are the CDN links to the dependency.
    public var htmlTags: [DependancyType: [String]] {
        switch self {
        case .bootstrap: return [.css: ["<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">", "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" integrity=\"sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp\" crossorigin=\"anonymous\">"], .javaScript: ["<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>"]]
        case .jQuery: return [.javaScript: ["<script src=\"https://code.jquery.com/jquery-3.1.1.min.js\" integrity=\"sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=\"crossorigin=\"anonymous\"></script>"]]
        }
    }
}
