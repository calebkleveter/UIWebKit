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

/// Designates the login that is used for creating the login form.
public enum LoginFormType {
    
    /// Sets the form as taking an email for the users login.
    case email
    
    /// Sets the form as taking a username for the login
    case username
}

/// A wrapper class for an HTML form.
open class UIForm {
    
    /// The HTML form that is the base of the class
    public let form = UIElement(element: .form)
    
    /// Creates a form with a label and input for each item.
    ///
    /// - Parameters:
    ///   - items: The items that will be used for each label/input combonation for the form.
    ///   - idPrefix: The prefix for the id's for the wrappr divs, inputs and labels. This defaults for `nil`.
    ///   - submitText: The text for the submission button.
    ///   - action: The path that the data will be sent to at form submission.
    public init(with items: [String], idPrefix: String? = nil, submitText: String, and action: String? = nil) {
        for item in items {
            self.form.add(UIFormElement(with: item, and: idPrefix))
        }
        let formSubmitButton = UIElement(element: .button)
        formSubmitButton.attributes["type"] = "submit"
        formSubmitButton.attributes["id"] = submitText.lowercased()
        formSubmitButton.add(submitText)
        self.form.add(formSubmitButton)
        
        guard let action = action else { return }
        
        self.form.attributes["action"] = action
        self.form.attributes["method"] = "POST"
    }
    
    /// Creates a form for loging in a user.
    ///
    /// - Parameters:
    ///   - login: The login that will be used to authenticate the user. This could be an email or username.
    ///   - action: The path that the data will be sent to at form submission.
    /// - Returns: A `UIForm` for authenticating a user.
    public class func loginForm(with login: LoginFormType, and action: String) -> UIForm {
        var formItems: [String] = []
        
        switch login {
        case .email: formItems.append("Email")
        case .username: formItems.append("Username")
        }
        formItems.append("Password")
        
        return UIForm(with: formItems, idPrefix: "user", submitText: "Login", and: action)
    }
    
    /// Creates a basic form for signing up a user.
    ///
    /// - Returns: The `UIForm` that contains the HTML form that will be submited on submission.
    public class func signUpForm() -> UIForm {
        return UIForm(with: ["Email", "Username", "Password"], idPrefix: "user", submitText: "Sign Up")
    }
    
    /// The top level element of the class. In this case, it is the form property.
    public var topElement: UIElement {
        return form
    }
}

extension UIForm: ElementRenderable {
    
    /// The top level element of `UIForm`. This is the `form` property.
    public var topLevelElement: UIElement {
        return self.form
    }
}

/// A label and input combonation that is used in a form.
open class UIFormElement {
    
    /// The label that says what the input is for.
    let label: UIElement
    
    /// The text input for the form. The type for the input could be `email`, `password`, or `text` depending on the name of the form element.
    let input: UIElement
    
    /// The div that acts as a wrapper for the input and the label.
    let elementWrapperDiv: UIElement
    
    /// Creates a `UIFormElement` that contains a label and an input.
    ///
    /// - Parameters:
    ///   - name: The name of the element. This is used to set the text in the label, set the placeholder in the input, and set the type of the input.
    ///   - idPrefix: The prefix for the element id's. This defaults to nil
    init(with name: String, and idPrefix: String? = nil) {
        self.label = UIElement(element: .label)
        self.input = UIElement(element: .input)
        self.elementWrapperDiv = UIElement(element: .div)
        
        let casedName = String(name.characters.first ?? Character("")).uppercased() + String(name.characters.dropFirst()).lowercased()
        let lowerCasedName = name.lowercased()
        
        elementWrapperDiv.attributes["id"] = idPrefix == nil ? lowerCasedName : idPrefix! + "-" + lowerCasedName
        
        label.attributes["for"] = lowerCasedName
        label.attributes["id"] = idPrefix == nil ? lowerCasedName + "-label" : idPrefix! + "-" + lowerCasedName + "-label"
        label.add(casedName)
        
        input.attributes["name"] = lowerCasedName
        input.attributes["id"] = idPrefix == nil ? lowerCasedName + "-input" : idPrefix! + "-" + lowerCasedName + "-input"
        input.attributes["placeholder"] = casedName
        
        if lowerCasedName == "email" || lowerCasedName == "e-mail" {
            input.attributes["type"] = "email"
        } else if lowerCasedName == "password" {
            input.attributes["type"] = "password"
        } else {
            input.attributes["type"] = "text"
        }
        
        elementWrapperDiv.add(label)
        elementWrapperDiv.add(input)
    }
}

extension UIFormElement: ElementRenderable {
    
    /// The top level element of the form element. This is the wrapper div.
    public var topLevelElement: UIElement {
        return self.elementWrapperDiv
    }
}
