![UIWebKit Icon](https://raw.githubusercontent.com/calebkleveter/UIWebKit/develop/icons/uiwebkit-icon-trimmed.png)

# UIWebKit

[![Build Status](https://travis-ci.org/calebkleveter/UIWebKit.svg?branch=master)](https://travis-ci.org/calebkleveter/UIWebKit)
[![Documentation Coverage](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMzYiIGhlaWdodD0iMjAiPjxsaW5lYXJHcmFkaWVudCBpZD0iYiIgeDI9IjAiIHkyPSIxMDAlIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiNiYmIiIHN0b3Atb3BhY2l0eT0iLjEiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3Atb3BhY2l0eT0iLjEiLz48L2xpbmVhckdyYWRpZW50PjxjbGlwUGF0aCBpZD0iYSI+PHJlY3Qgd2lkdGg9IjEzNiIgaGVpZ2h0PSIyMCIgcng9IjMiIGZpbGw9IiNmZmYiLz48L2NsaXBQYXRoPjxnIGNsaXAtcGF0aD0idXJsKCNhKSI+PHBhdGggZmlsbD0iIzU1NSIgZD0iTTAgMGg5M3YyMEgweiIvPjxwYXRoIGZpbGw9IiM0YzEiIGQ9Ik05MyAwaDQzdjIwSDkzeiIvPjxwYXRoIGZpbGw9InVybCgjYikiIGQ9Ik0wIDBoMTM2djIwSDB6Ii8+PC9nPjxnIGZpbGw9IiNmZmYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtZmFtaWx5PSJEZWphVnUgU2FucyxWZXJkYW5hLEdlbmV2YSxzYW5zLXNlcmlmIiBmb250LXNpemU9IjExIj48dGV4dCB4PSI0Ni41IiB5PSIxNSIgZmlsbD0iIzAxMDEwMSIgZmlsbC1vcGFjaXR5PSIuMyI+ZG9jdW1lbnRhdGlvbjwvdGV4dD48dGV4dCB4PSI0Ni41IiB5PSIxNCI+ZG9jdW1lbnRhdGlvbjwvdGV4dD48dGV4dCB4PSIxMTMuNSIgeT0iMTUiIGZpbGw9IiMwMTAxMDEiIGZpbGwtb3BhY2l0eT0iLjMiPjEwMCU8L3RleHQ+PHRleHQgeD0iMTEzLjUiIHk9IjE0Ij4xMDAlPC90ZXh0PjwvZz48L3N2Zz4=)](https://calebkleveter.github.io/UIWebKit-Docs/)

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

## Contributing:

Read the contribution guidlines [here](https://github.com/calebkleveter/UIWebKit/blob/master/CONTRIBUTING.md).

## License:

All code is under the [MIT license](https://github.com/calebkleveter/UIWebKit/blob/master/LICENSE) agreement.
