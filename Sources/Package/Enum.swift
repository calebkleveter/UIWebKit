//
//  File.swift
//  UIWebKit
//
//  Created by Caleb Kleveter on 12/16/16.
//
//

import Foundation

public enum Element: String {
    case a
    case abbr
    case address
    case area
    case b
    case base
    case bdo
    case blockquote
    case body
    case br
    case button
    case caption
    case cite
    case code
    case col
    case colgroup
    case dd
    case del
    case dfn
    case div
    case dl
    case dt
    case em
    case fieldset
    case form
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case head
    case hr
    case html
    case i
    case iframe
    case img
    case input
    case ins
    case kbd
    case label
    case map
    case meta
    case noscript
    case object
    case ol
    case optgroup
    case option
    case p
    case param
    case pre
    case q
    case s
    case samp
    case script
    case select
    case small
    case span
    case strong
    case style
    case sub
    case sup
    case table
    case tbody
    case th
    case thread
    case title
    case tr
    case u
    case ul
    case `var`
}

public enum RenderError: Error {
    case failedStringToData
}

public enum FileCreationError: Error {
    case noDroplet
}
