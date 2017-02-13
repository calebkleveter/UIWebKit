# UIWebKit

Create UI's for Vapor without HTML.

## Example:

Create a class to control the creation of a web page:

```swift
import Foundation
import UIWebKit
import Vapor

final class MainView: UIWebPage {

    override func configure() {
        addSectionText()
        addHead()
    }

    func addSectionText() {
        let content = UIElement(element: Element.p)
        content.add("Text")
        content.attributes["style"] = "font-family: Roboto, sans-serif;"
        for _ in 0...10 {
            section.add(content)
        }
    }

    func addHead() {
        let title = UIElement(element: .title)
        title.add("UIWebKit Example")
        let link = UIElement(element: .link)
        link.attributes["rel"] = "stylesheet"
        link.attributes["href"] = "https://fonts.googleapis.com/css?family=Roboto"
        head.add(title)
        head.add(link)
    }
}
```

Use the class to create the page:

```swift
drop.get("about") { req in
    return try MainView().render()
}
```
## Documentation:

You can get the API documentation [here](https://calebkleveter.github.io/UIWebKit-Docs/).
