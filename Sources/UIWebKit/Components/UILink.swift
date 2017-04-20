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

/// A wrapper class for a `UIElement` that represents a `link` element.
open class UILink {
    
    /// The `link` element that the class represents.
    public let link: UIElement = UIElement(element: .link)
    
    /// The `rel` attribute for the `link` tag.
    public var rel: String = "" {
        didSet {
            link.attributes["rel"] = rel
        }
    }
    
    /// The `href` attribute for the `link` tag.
    public var href: String = "" {
        didSet {
            link.attributes["href"] = href
        }
    }
    
    /// Creates a instance of `UILink` with an `href` and `rel` properties.
    ///
    /// - Parameters:
    ///   - href: The path the the document being linked to.
    ///   - rel: The relationship between the linked document to the current document. View the HTML [documention](http://devdocs.io/html/element/link) for more details.
    init(href: String, rel: String) {
        self.href = href
        self.rel = rel
    }
}

extension UILink: ElementRenderable {
    
    /// The `link` tag represented by a `UIElement` object that is controlled by an instance `UILink`.
    public var topLevelElement: UIElement {
        return link
    }
}
