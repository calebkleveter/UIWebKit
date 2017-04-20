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

/// `UIParagraph` is a wrapper class around a `p` HTML tag which is represented by a `UIElement`.
open class UIParagraph {
    
    /// The `p` element that is represented by the object.
    public let p = UIElement(element: .p)
    
    /// The text held in the `p` element.
    public var text: String {
        didSet {
            self.p.add(self.text)
        }
    }
    
    /// Creates a `UIParagraph` with the desired text.
    ///
    /// - Parameter text: The text used in the objects `p` element.
    public init(text: String) {
        self.text = text
        self.p.add(text)
    }
}

extension UIParagraph: ElementRenderable {
    
    /// The top level `p` element of the `UIParagraph`.
    public var topLevelElement: UIElement {
        return p
    }
}
