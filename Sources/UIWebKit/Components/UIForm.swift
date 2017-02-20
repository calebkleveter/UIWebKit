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

public enum LoginFormType {
    case email
    case username
}

open class UIForm {
    public let form = UIElement(element: .form)
    
    public init(with items: [String], idPrefix: String? = nil, submitText: String) {
        for item in items {
            let casedName = String(item.characters.first ?? Character("")).uppercased() + String(item.characters.dropFirst()).lowercased()
            let lowerCasedName = item.lowercased()
            
            let formItemDiv = UIElement(element: .div)
            formItemDiv.attributes["id"] = idPrefix == nil ? lowerCasedName : idPrefix! + "-" + lowerCasedName
            
            let formItemLabel = UIElement(element: .label)
            formItemLabel.attributes["for"] = lowerCasedName
            formItemLabel.attributes["id"] = idPrefix == nil ? lowerCasedName + "-label" : idPrefix! + "-" + lowerCasedName + "-label"
            formItemLabel.add(casedName)
            
            let formItemInput = UIElement(element: .input)
            formItemInput.attributes["name"] = lowerCasedName
            formItemInput.attributes["id"] = idPrefix == nil ? lowerCasedName + "-input" : idPrefix! + "-" + lowerCasedName + "-input"
            formItemInput.attributes["placeholder"] = casedName
            
            if lowerCasedName == "email" || lowerCasedName == "e-mail" {
                formItemInput.attributes["type"] = "email"
            } else if lowerCasedName == "password" {
                formItemInput.attributes["type"] = "password"
            } else {
                formItemInput.attributes["type"] = "text"
            }
            
            let formSubmitButton = UIElement(element: .button)
            formSubmitButton.attributes["type"] = "submit"
            formSubmitButton.attributes["id"] = submitText.lowercased()
            formSubmitButton.add(submitText)
            
            formItemDiv.add(formItemLabel)
            formItemDiv.add(formItemInput)
            formItemDiv.add(formSubmitButton)
            
            self.form.add(formItemDiv)
        }
    }
    
    public class func loginForm(with login: LoginFormType) -> UIForm {
        var formItems: [String] = []
        
        switch login {
        case .email: formItems.append("Email")
        case .username: formItems.append("Username")
        }
        formItems.append("Password")
        
        return UIForm(with: formItems, idPrefix: "user", submitText: "Login")
    }
}
