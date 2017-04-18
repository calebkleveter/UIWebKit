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

/// All the HTML elements that can be created.
public enum Element: String {

    /// For creating an anchor element.
    case a

    /// For creating an abbreviation element.
    case abbr

    /// For creating an address element.
    case address

    /// For creating an area element.
    case area

    /// For creating an article element.
    case article

    /// For creating an aside element.
    case aside

    /// For creating an audio element.
    case audio

    /// For creating a b element.
    case b

    /// For creating a base element.
    case base

    /// For creating a bi-directional isolation element.
    case bdi

    /// For creating a bidirectional override element.
    case bdo

    /// For creating a blockquote element.
    case blockquote

    /// For creating a body element.
    case body

    /// For creating a break element.
    case br

    /// For creating a button element.
    case button

    /// For creating a canvas element.
    case canvas

    /// For creating a caption element.
    case caption

    /// For creating a cite element.
    case cite

    /// For creating a code element.
    case code

    /// For creating a table column element.
    case col

    /// For creating a table column group element.
    case colgroup

    /// For creating a data element.
    case data

    /// For creating a datalist element.
    case datalist

    /// For creating a description element.
    case dd

    /// For creating a deleted text element.
    case del

    /// For creating a details element.
    case details

    /// For creating a definition element.
    case dfn

    /// For creating a dialog element.
    case dialog

    /// For creating a div element.
    case div

    /// For creating a description list element.
    case dl

    /// For creating a definition term element.
    case dt

    /// For creating an element element.
    case element

    /// For creating an emphasis element.
    case em

    /// For creating an embed element.
    case embed

    /// For creating a fieldset element.
    case fieldset

    /// For creating a figcaption element.
    case figcaption

    /// For creating a figure element.
    case figure

    /// For creating a footer element.
    case footer

    /// For creating a form element.
    case form

    /// For creating an h1 element.
    case h1

    /// For creating an h2 element.
    case h2

    /// For creating an h3 element.
    case h3

    /// For creating an h4 element.
    case h4

    /// For creating an h5 element.
    case h5

    /// For creating an h6 element.
    case h6

    /// For creating an head element.
    case head

    /// For creating an header element.
    case header

    /// For creating an hr element.
    case hr

    /// For creating an html element.
    case html

    /// For creating an i element.
    case i

    /// For creating an iframw element.
    case iframe

    /// For creating an image element.
    case img

    /// For creating an input element.
    case input

    /// For creating an inserted text element.
    case ins

    /// For creating a keyboard input element.
    case kbd

    /// For creating a label element.
    case label

    /// For creating a legend element.
    case legend

    /// For creating an li element.
    case li

    /// For creating a link element.
    case link

    /// For creating a main element.
    case main

    /// For creating a map element.
    case map

    /// For creating a mark element.
    case mark

    /// For creating a menu element.
    case menu

    /// For creating a menuitem element.
    case menuitem

    /// For creating a meta element.
    case meta

    /// For creating a meter element.
    case meter

    /// For creating a nav element.
    case nav

    /// For creating a noscript element.
    case noscript

    /// For creating an object element.
    case object

    /// For creating an orderd list element.
    case ol

    /// For creating an optgroup element.
    case optgroup

    /// For creating an option element.
    case option

    /// For creating an output element.
    case output

    /// For creating a p element.
    case p

    /// For creating a param element.
    case param

    /// For creating a picture element.
    case picture

    /// For creating a pre element.
    case pre

    /// For creating a progress element.
    case progress

    /// For creating a quote element.
    case q

    /// For creating an rp element.
    case rp

    /// For creating an rt element.
    case rt

    /// For creating an rtc element.
    case rtc

    /// For creating a ruby element.
    case ruby

    /// For creating a strikethrough element.
    case s

    /// For creating a samp element.
    case samp

    /// For creating a script element.
    case script

    /// For creating a section element.
    case section

    /// For creating a select element.
    case select

    /// For creating a source element.
    case source

    /// For creating a small element.
    case small

    /// For creating a span element.
    case span

    /// For creating a strong element.
    case strong

    /// For creating a style element.
    case style

    /// For creating a sub element.
    case sub

    /// For creating a summary element.
    case summary

    /// For creating a sup element.
    case sup

    /// For creating a table element.
    case table

    /// For creating a table body element.
    case tbody

    /// For creating a table cell element.
    case td

    /// For creating a template element.
    case template

    /// For creating a table header cell element.
    case th

    /// For creating a thread element.
    case thread

    /// For creating a time element.
    case time

    /// For creating a title element.
    case title

    /// For creating a table row element.
    case tr

    /// For creating a track element.
    case track

    /// For creating an underline element.
    case u

    /// For creating an un-ordered list element.
    case ul

    /// For creating a var element.
    case `var`

    /// For creating a video element.
    case video

    /// For creating a word break opportunity element.
    case wbr

    var isSingleTag: Bool {
      switch self {
      case .area: return true
      case .base: return true
      case .br: return true
      case .col: return true
      case .colgroup: return true
      case .embed: return true
      case .hr: return true
      case .img: return true
      case .input: return true
      case .link: return true
      case .meta: return true
      case .param: return true
      case .source: return true
      case .track: return true
      case .wbr: return true
      default: return false
      }
    }
}
