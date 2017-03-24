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

/// A wrapper object around a navigation element with a unordered list of anchors.
open class UINavigation {
    
    /// The top level nav of the `UINavigation` object.
    public let nav = UIElement(element: .nav)
    
    /// The link and text the navigations anchor elements are created from.
    var anchorAttributes: [String: String]
    
    /// The anchor elements in the `nav's` unordered list.
    public var anchors: [UIAnchor]
    
    /// Creates a `UINavigation` with the attributs for the anchor elements.
    ///
    /// - Parameter navItems: The dictionary used for getting the information for the anchors. The key is used for the text and the value is used as the link.
    init(navItems: [String: String]) {
        self.anchorAttributes = navItems
        self.anchors = anchorAttributes.map({ (title, link) -> UIAnchor in
            UIAnchor(title: title, link: link)
        })
        self.nav.add(UIUnorderedList(elements: self.anchors))
    }
}

extension UINavigation: ElementRenderable {
    
    /// The top level `nav` element of the `UINavigation` object.
    public var topLevelElement: UIElement {
        return self.nav
    }
}
