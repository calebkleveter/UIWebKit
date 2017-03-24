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

/// A wrapper class that represents an HTML `ul` element.
open class UIUnorderedList {
    
    /// The base `ul` element of the `UIUnorderedList` object.
    public let ul = UIElement(element: .ul)
    
    /// The list items used in the unordered list.
    public private(set) var listItems: [UIListItem] = []
}

/// A wrapper class around an `ol` (odered list) element.
open class UIOrderedList {
    
    /// The `ol` element that is represented by this class.
    public let ol = UIElement(element: .ol)
    
    /// The list items used in the ordered list.
    public private(set) var listItems: [UIListItem] = []
    
    /// Creates a `UIOrderedList` with text in the list items.
    ///
    /// - Parameter text: The strings for the `UIListItems`.
    public init(text: String...) {
        self.listItems = text.map { UIListItem(text: $0) }
        _ = listItems.map { ol.add($0) }
    }
    
    /// Creates a `UIOrderedList` with children in the list items.
    ///
    /// - Parameter elements: The elements that will be used in the `li` elements.
    public init(elements: UIElement...) {
        self.listItems = elements.map { UIListItem(children: $0) }
        _ = listItems.map { ol.add($0) }
    }
    
    /// Creates a `UIOrderedList` with custom `UIListItems`.
    ///
    /// - Parameter listElements: The `UIListItems` for the `UIOrderedList` ol.
    public init(with listElements: UIListItem...) {
        self.listItems = listElements
        _ = listItems.map { ol.add($0) }
    }
}

extension UIOrderedList: ElementRenderable {
    
    /// The top level `ol` element of the object.
    public var topLevelElement: UIElement {
        return self.ol
    }
}

/// A wrapper class for li (list) elements.
open class UIListItem {
    
    /// The base list element of the class
    public let li = UIElement(element: .li)
    
    /// The child elements of the li.
    public var children: [UIElement] = []
    
    /// The text for the list element.
    public let text: String?
    
    /// Creates a `UIListItem` with the text passed in.
    ///
    /// - Parameter text: The text for instances `li` property.
    public init(text: String? = nil) {
        self.text = text
        if let text = text { li.add(text) }
    }
    
    /// Creates a `UIListItem` with children and no text.
    ///
    /// - Parameter children: The elements that are to be the children of the `li` element.
    public init(children: UIElement...) {
        self.text = nil
        self.children = children
        for child in children { li.add(child) }
    }
}

extension UIListItem: ElementRenderable {
    
    /// The `li` property of the instance of `UIListItem`.
    public var topLevelElement: UIElement {
        return self.li
    }
}
