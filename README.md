# UIWebKit

Create UI's for Vapor without HTML.

## Example:

Create a class to control the creation of a web page:

    import Vapor
    import UIWebKit

    class AboutView {
        let head: UIElement = UIElement(element: Element.head)
        let header: UIElement = UIElement(element: Element.header)
        let section: UIElement = UIElement(element: Element.section)
        let footer: UIElement = UIElement(element: Element.footer)

        func addChildren() {
            let copyRight: UIElement = UIElement(element: Element.p)
            copyRight.text = "&copy; Caleb Kleveter 2016"
            footer.children.append(copyRight)
        }

        func render(with drop: Droplet) -> String? {
            self.addChildren()
            let page = UIWebPage(head: head, header: header, section: section, footer: footer)
            page.add(drop)
            do {
                return try page.render()
            } catch let error {
                print(error)
            }
            return nil
        }
    }

Use the class to create the page:

    drop.get("about") { req in
        let about = AboutView()
        if let page = about.render(with: drop) {
            return try drop.view.make(page, [
                "message": drop.localization[req.lang, "welcome", "title"]
            ])
        } else {
            throw Abort.custom(status: .internalServerError, message: "Unable to Create Page.")
        }

    }
