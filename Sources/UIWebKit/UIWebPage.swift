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
import Vapor

/// Represents a web page and contains all the HTML elements.
public class UIWebPage {
    
    /// The head in a web page.
    public var head: UIElement
    
    /// The header of the page.
    public var header: UIElement
    
    /// The section between the header and the footer of the page.
    public var section: UIElement
    
    /// The footer of the page.
    public var footer: UIElement
    
    /// Dependancies that will be loaded into the webpage such as Bootstrap or JQuery.
    private(set) var dependancies: [Dependancy] = []
    
    /// The droplet that is used for putting the .html file that is rendered in the proper location.
    private var drop: Droplet?
    
    
    /// Creates a web page with a head, header, section and footer.
    ///
    /// - parameter head: The head of the page.
    /// - parameter header: The header of the page.
    /// - parameter section: The section element that goes between the header and footer
    /// - parameter footer: The footer of the page.
    ///
    /// - returns: A UIWebPage with all the neccasary elements.
    public init(head: UIElement, header: UIElement, section: UIElement, footer: UIElement) {
        self.head = head
        self.header = header
        self.section = section
        self.footer = footer
    }
    
    /// Takes the elements and renders them.
    private func render()throws -> View {
        var html = ""
        html.append("<!DOCTYPE html>")
        for dependancy in dependancies {
            if let cssTags = dependancy.htmlTags[.css] {
                for tag in cssTags {
                    head.inject(tag)
                }
            }
        }
        html.append(head.parse())
        html.append("<body>")
        html.append(header.parse())
        html.append(section.parse())
        html.append(footer.parse())
        for dependancy in dependancies {
            if let jsTags = dependancy.htmlTags[.javaScript] {
                for tag in jsTags {
                    html.append(tag)
                }
            }
        }
        html.append("</body>")
        
        return try View(bytes: html.bytes)
    }
    
    /// Adds a droplet to the web page for creating the file in the correct directory.
    ///
    /// - parameter drop: The droplet that is added to the UIWebPage.
    public func add(_ drop: Droplet) {
        self.drop = drop
    }
    
    /// Adds dependancies that will be loaded into the webpage.
    ///
    /// - Parameter dependancy: The dependancy that will added to the webpage.
    public func `import`(_ dependancy: Dependancy) {
        self.dependancies.append(dependancy)
    }
}
