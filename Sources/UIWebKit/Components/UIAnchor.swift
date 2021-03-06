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

/// A wrapper around an HTML `a` (anchor) element. This is what is used for links.
open class UIAnchor {
    
    /// The anchor element `UIAnchor` represents.
    public let anchor = UIElement(element: .a)
    
    /// The text in the anchor.
    public var title: String {
        didSet {
            self.anchor.add(title)
        }
    }
    
    /// The link the anchor opens when selected.
    public var link: String {
        didSet {
            self.anchor.attributes["href"] = link
        }
    }
    
    /// Creates a basic `UIAnchor` object with a title and link.
    ///
    /// - Parameters:
    ///   - title: The text that is used for the anchor element.
    ///   - link: The link the anchor will open when it is selected.
    public init(title: String, link: String) {
        self.title = title
        self.link = link
        anchor.attributes["href"] = link
        anchor.add(title)
    }
}

extension UIAnchor: ElementRenderable {
    
    /// The top level anchor element of the `UIAnchor` object.
    public var topLevelElement: UIElement {
        return self.anchor
    }
}
