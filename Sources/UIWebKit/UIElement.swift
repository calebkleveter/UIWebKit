import Foundation
import Vapor

public class UIElement {
    public var element: Element
    public var start: String
    public var end: String
    
    public init(element: Element) {
        self.element = element
        self.start = "<\(element.rawValue)>"
        self.end = "</\(element.rawValue)>"
    }
    
    public var attributes: [String: String] = [:]
    
    public var text: String = ""
    public var children: [UIElement] = []
    
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
        let html = parse()
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
    
    private func parse() -> String {
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










