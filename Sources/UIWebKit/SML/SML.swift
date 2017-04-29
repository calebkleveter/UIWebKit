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

/// Creates a `UIWebPage`.
///
/// - Parameters:
///   - title: The title of the page. This string is used in the `title` tag.
///   - handler: The closure where child elements are added to the base elements of the page. They are the `head`, `header`, `section`, and `footer` in that order.
public func page(title: String, _ handler:(UIElement, UIElement, UIElement, UIElement)->()) {
    let page = UIWebPage(title: title)
    handler(page.head, page.header, page.section, page.footer)
}

public extension UIElement {
    
    /// Adds an anchor element to the `UIElement`.
    ///
    /// - Parameters:
    ///   - text: The text that is displayed by the anchor.
    ///   - href: The URL that the anchor links to.
    ///   - `class`: The classes for the anchor element.
    ///   - id: The ids for the anchor element.
    ///   - handler: The closure where child elements are added to the anchor element.
    func a(_ text: String, href: String, `class`: String = "", id: String = "", _ handler:(UIElement)->() = {a in}) {
        let an = UIAnchor(title: text, link: href)
        an.anchor.attributes["class"] = `class`
        an.anchor.attributes["id"] = id
        handler(an.anchor)
        self.add(an)
    }
    
    
    /// Adds an abbreviation element to the `UIElement`.
    ///
    /// - Parameters:
    ///   - text: The text that is displayed by the abbreviation.
    ///   - title: Full description of the abbreviation.
    ///   - `class`: The classes for the abbreviation element.
    ///   - id: The ids for the abbreviation element.
    ///   - handler: The closure where child elements are added to the abbreviation element.
    func abbr(_ text: String, title: String, `class`: String = "", id: String = "", _ handler:(UIElement)->() = {a in}) {
        let ab = UIElement(element: .abbr)
        ab.add(text)
        ab.attributes["title"] = title
        ab.attributes["class"] = `class`
        ab.attributes["id"] = id
        handler(ab)
        self.add(ab)
    }
    
    /// Adds an address element to the `UIElement`.
    ///
    /// - Parameters:
    ///   - text: The text that is displayed by the `address` element.
    ///   - `class`: The classes for the `address` element.
    ///   - id: The ids for the `address` element.
    ///   - handler: The closure where child elements are added to the `address` element.
    func address(_ text: String, `class`: String = "", id: String = "", _ handler:(UIElement)->() = {a in}) {
        let address = UIElement(element: .address)
        address.add(text)
        address.attributes["class"] = `class`
        address.attributes["id"] = id
        handler(address)
        self.add(address)
    }
}
