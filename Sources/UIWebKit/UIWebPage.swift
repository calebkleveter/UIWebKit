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
    
    
    /// Renders the pages elements into HTML, creates a .html file and puts the HTML in the file.
    ///
    /// - parameter name: The name of the file that will be created. It defaults to the name of the .swift file this method is called in.
    ///
    /// - returns: The name of the file that is created, i.e. "about".
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
        
        guard let name = fileName else {
            return nil
        }
        return name + ".html"
    }
    
    /// Takes the elements and renders them.
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
    
    /// Creates the .html file and adds the HTML to it.
    private func createLeafFile(with name: String, and data: Data)throws {
        let manager = FileManager()
        if let drop = drop {
            if manager.fileExists(atPath: "\(drop.viewsDir)/\(name).html") {
                if let url = URL(string: "\(drop.viewsDir)/\(name).html") {
                    do {
                        try data.write(to: url)
                    } catch let error {
                        throw error
                    }
                } else {
                    throw FileCreationError.dataCannotWrite
                }
            } else {
                manager.createFile(atPath: "\(drop.viewsDir)/\(name).html", contents: data, attributes: nil)
            }
        } else {
            throw FileCreationError.noDroplet
        }
    }
    
    /// Adds a droplet to the web page for creating the file in the correct directory.
    ///
    /// - parameter drop: The droplet that is added to the UIWebPage.
    public func add(_ drop: Droplet) {
        self.drop = drop
    }
}
