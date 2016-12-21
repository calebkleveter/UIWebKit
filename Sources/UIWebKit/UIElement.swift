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
        self.element = element
        self.start = "<\(element.rawValue)>"
        self.end = "</\(element.rawValue)>"
    }
    
    /// The attributes that are added to the element on parsing.
    public var attributes: [String: String] = [:]
    
    /// The elements text.
    public var text: String = ""
    
    /// The elements children.
    public var children: [UIElement] = []
    
    /// Creates HTML from the current element and all it's children
    ///
    /// - returns: The HTML from the current elements and it's children.
    public func parse() -> String {
        var html = ""
        self.appendAttributes()
        html.append(self.start)
        html.append(text)
        if !children.isEmpty {
            for element in children {
                html.append(element.parse())
            }
        }
        html.append(self.end)
        return html
    }
    
    /// Adds the elements attributes to it's opening tag.
    private func appendAttributes() {
        var attr = ""
        for (key, value) in self.attributes {
            attr.append("\(key)='\(value)' ")
        }
        start = "<\(element.rawValue) \(attr)>"
    }
}

public class UIWebPage {
    public var head: UIElement
    public var header: UIElement
    public var section: UIElement
    public var footer: UIElement
    
    public var drop: Droplet?
    
    public init(head: UIElement, header: UIElement, section: UIElement, footer: UIElement) {
        self.head = head
        self.header = header
        self.section = section
        self.footer = footer
    }
    
    public func render(with name: String = #file)throws -> String? {
        let html = renderHTML()
        let data = html.data(using: String.Encoding.utf8)
        let file = name.components(separatedBy: "/").last
        let fileName = file?.components(separatedBy: ".")[0]
        
        if let data = data {
            if let fileName = fileName {
                do {
                    try createLeafFile(with: fileName, and: data)
                } catch let error {
                    throw error
                }
            } else {
                throw FileCreationError.fileNonExisting
            }
        } else {
            throw RenderError.failedStringToData
        }
        
        return fileName
    }
    
    private func renderHTML() -> String {
        var html = ""
        html.append("<!DOCTYPE html>")
        html.append(head.parse())
        html.append("<body>")

        html.append(header.parse())
        html.append(section.parse())
        html.append(footer.parse())
        
        html.append("</body>")
        
        return html
    }
    
    private func createLeafFile(with name: String, and data: Data)throws {
        let manager = FileManager()
        if let drop = drop {
            if manager.fileExists(atPath: "\(drop.viewsDir)/\(name).leaf") {
                if let url = URL(string: "\(drop.viewsDir)/\(name).leaf") {
                    do {
                        try data.write(to: url)
                    } catch let error {
                        throw error
                    }
                } else {
                    throw FileCreationError.dataCannotWrite
                }
            } else {
                manager.createFile(atPath: "\(drop.viewsDir)/\(name).leaf", contents: data, attributes: nil)
            }
        } else {
            throw FileCreationError.noDroplet
        }
    }
    
    public func add(_ drop: Droplet) {
        self.drop = drop
    }
}
