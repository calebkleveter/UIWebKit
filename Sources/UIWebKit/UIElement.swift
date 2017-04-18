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
import SwiftMark

/// A UIElement works as the wrapper for an HTML element.
public class UIElement {

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
        switch element.isSingleTag {
        case true:
            self.element = element
            self.start = "<\(element.rawValue)/>"
            self.end = ""
        case false:
            self.element = element
            self.start = "<\(element.rawValue)>"
            self.end = "</\(element.rawValue)>"
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

    /// Adds text to an element _if_ it is not an empty element. The text is safety encoded.
    ///
    /// - parameter text: The text to add to the element.
    public func add(_ text: String) {
        if !element.isSingleTag {
            self.text = text.safetyHTMLEncoded()
        }
    }

    /// Adds text to an element _if_ it is not a single tag element. Note that this text is not safety encoded.
    ///
    /// - Parameter text: The text that will be added to the element. If you want to know more, ask Jon Skeet 🦄.
    public func addRaw(_ text: String) {
        if !element.isSingleTag {
            self.text = text
        }
    }

    /// Adds a child element to an element _if_ it is not an empty element.
    ///
    /// - parameter child: The element to add to the element.
    public func add(_ child: ElementRenderable) {
        if !element.isSingleTag {
            self.children.append(child)
        }
    }

    /// Adds a String to the rawElements array _if_ it is not a single tag element.
    ///
    /// - Parameter element: The element that will be added as a child of the current element.
    public func inject(_ element: String) {
        if !self.element.isSingleTag {
            self.rawElements.append(element)
        }
    }


    /// Renders Markdown to HTML that gets added as child elements. This method uses `.inject(string)` for adding the elements.
    ///
    /// - Parameter string: The Markdown that will be rendered to HTML.
    public func addMarkdown(_ string: String)throws {
        if !element.isSingleTag {
            let renderer = MarkdownRenderer()
            let html = try renderer.render(string)
            self.inject(html)
        }
    }

    /// Creates HTML from the current element and all it's children. This method is deprecated due to bad naming. Use the `render()` method instead.
    ///
    /// - returns: The HTML from the current elements and it's children.
    @available(*, deprecated: 2.0, message: "Use the render method instead. This method will be removed in version 4")
    public func parse() -> String {
        print("[UIWebKit: \(Date.init())] - The parse() method is deprecated and will be removed in version 4. Use the render() method instead.")
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
                html.append(element.topLevelElement.render())
            }
        }
        html.append(self.end)
        return html
    }

    /// Creates HTML from the current element and all it's children.
    ///
    /// - Returns: The HTML from the current elements and it's children.
    public func render() -> String {
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
                html.append(element.topLevelElement.render())
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
}

extension UIElement: ElementRenderable {

    /// The top level element of the current element. This means `self`.
    public var topLevelElement: UIElement {
        return self
    }
}
