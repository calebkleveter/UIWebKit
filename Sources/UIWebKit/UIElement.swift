import Foundation
import Vapor

class UIElement {
    var element: Element
    var start: String
    var end: String
    
    init(element: Element) {
        self.element = element
        self.start = "<\(element.rawValue)>"
        self.end = "<\\\(element.rawValue)>"
    }
    
    var attributes: [String: String] = [:]
    
    var text: String = ""
    var children: [UIElement] = []
    
    func parse() -> String {
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
        start = "< \(element.rawValue) \(attr)>"
    }
}

class UIWebPage {
    var header: UIElement
    var section: UIElement
    var footer: UIElement
    
    var drop: Droplet?
    
    init(header: UIElement, section: UIElement, footer: UIElement) {
        self.header = header
        self.section = section
        self.footer = footer
    }
    
    func render()throws {
        let html = parse()
        let data = html.data(using: String.Encoding.utf8)
        
        if let data = data {
            do {
                try createLeafFile(with: #file.components(separatedBy: ".")[1], and: data)
            } catch let error {
                throw error
            }
        } else {
            throw RenderError.failedStringToData
        }
    }
    
    private func parse() -> String {
        var html = ""
        html.append("<!DOCTYPE html>")
        html.append("<head></head>")
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
            manager.createFile(atPath: "\(drop.viewsDir)/\(name).leaf", contents: data, attributes: nil)
        } else {
            throw FileCreationError.noDroplet
        }
    }
    
    func add(_ drop: Droplet) {
        self.drop = drop
    }
}










