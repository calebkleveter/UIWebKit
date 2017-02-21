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

/// A UIElement works as the wrapper for an HTML element.
public class UIElement: ElementPresentable {
    
    /// Denotes whether the element is a single tag element or not.
    private var isSingleTag: Bool
    
    /// The element that is returned when the UIElement is parsed.
    public var element: Element
    
    /// The opening tag of the element.
    public var start: String
    
    /// The closing tag of the element.
    public var end: String
    
    /// Create an instance of UIElement that is the element passed in.
    ///
    /// - parameter element: The element that is created by `.parse()`.
    ///
    /// - returns: An instance of UIElement with it's properties initilized with the element passed in.
    public init(element: Element) {
        switch element {
        case .area:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .base:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .br:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .col:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .colgroup:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .embed:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .hr:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .img:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .input:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .link:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .meta:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .param:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .source:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .track:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        case .wbr:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
            self.isSingleTag = true
        default:
            self.element = element
            self.start = "<\(element.rawValue)>"
            self.end = "</\(element.rawValue)>"
            self.isSingleTag = false
        }
    }
    
    /// The attributes that are added to the element on parsing.
    public var attributes: [String: String] = [:]
    
    /// The elements text.
    public private(set)var text: String = ""
    
    /// The elements children.
    public private(set)var children: [ElementRenderable] = []
    
    /// Child elements that are added in String format. Note that these elements are added as children _first_.
    public private(set)var rawElements: [String] = []
    
    /// Adds text to an element _if_ it is not an empty element.
    ///
    /// - parameter text: The text to add to the element.
    public func add(_ text: String) {
        if !isSingleTag {
            self.text = text
        }
    }
    
    /// Adds a child element to an element _if_ it is not an empty element.
    ///
    /// - parameter child: The element to add to the element.
    public func add(_ child: ElementRenderable) {
        if !isSingleTag {
            self.children.append(child)
        }
    }
    
    /// Adds a String to the rawElements array _if_ it is not a single tag element.
    ///
    /// - Parameter element: The element that will be added as a child of the current element.
    public func inject(_ element: String) {
        if !isSingleTag {
            self.rawElements.append(element)
        }
    }
    
    /// Creates HTML from the current element and all it's children
    ///
    /// - returns: The HTML from the current elements and it's children.
    public func parse() -> String {
        var html = ""
        self.appendAttributes()
        html.append(self.start)
        html.append(text)
        if !rawElements.isEmpty {
            for element in rawElements {
                html.append(element)
            }
        }
        if !children.isEmpty {
            for element in children {
                html.append(element.topLevelElement.parse())
            }
        }
        html.append(self.end)
        return html
    }
    
    /// Adds the elements attributes to it's opening tag.
    private func appendAttributes() {
        var attr = ""
        for (key, value) in self.attributes {
            attr.append("\(key)=\"\(value)\" ")
        }
        start = "<\(element.rawValue) \(attr)>"
    }
    
    /// The top level element of the class. In this case, it is `self`.
    public var topElement: UIElement {
        return self
    }
}

extension UIElement: ElementRenderable {
    
    /// The top level element of the current element. This means `self`.
    public var topLevelElement: UIElement {
        return self
    }
}
