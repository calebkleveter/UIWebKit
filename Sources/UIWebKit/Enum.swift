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
    case article
    case aside
    case audio
    case b
    case base
    case bdi
    case bdo
    case blockquote
    case body
    case br
    case button
    case canvas
    case caption
    case cite
    case code
    case col
    case colgroup
    case data
    case datalist
    case dd
    case del
    case details
    case dfn
    case dialog
    case div
    case dl
    case dt
    case element
    case em
    case embed
    case fieldset
    case figcaption
    case figure
    case footer
    case form
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    case head
    case header
    case hr
    case html
    case i
    case iframe
    case img
    case input
    case ins
    case kbd
    case label
    case main
    case map
    case mark
    case menu
    case menuitem
    case meta
    case meter
    case nav
    case noscript
    case object
    case ol
    case optgroup
    case option
    case output
    case p
    case param
    case picture
    case pre
    case progress
    case q
    case rp
    case rt
    case rtc
    case ruby
    case s
    case samp
    case script
    case section
    case select
    case source
    case small
    case span
    case strong
    case style
    case sub
    case summary
    case sup
    case table
    case tbody
    case template
    case th
    case thread
    case time
    case title
    case tr
    case track
    case u
    case ul
    case `var`
    case video
    case wbr
}

public enum RenderError: Error {
    case failedStringToData
}

public enum FileCreationError: Error {
    case noDroplet
    case dataCannotWrite
    case fileNonExisting
}
