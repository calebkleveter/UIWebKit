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

open class UITable {}

open class UITableRow {
    public let row: UIElement
    public var cells: [UITableCell]
    
    public init(with data: [String]) {
        self.row = UIElement(element: .tr)
        self.cells = []
        
        for string in data {
            self.cells.append(UITableCell(with: string))
        }
    }
}

open class UITableRowHeader {
    public let rowHeader: UIElement
    public var cellHeaders: [UITableCellHeader]
    
    public init(with data: [String]) {
        self.rowHeader = UIElement(element: .tr)
        self.cellHeaders = []
        
        for string in data {
            self.cellHeaders.append(UITableCellHeader(with: string))
        }
    }
}

/// Handles the header cell of an HTML table header row.
open class UITableCellHeader {
    
    /// The header cell that contains the description of the data contained in subsequent cells.
    public let cellHeader: UIElement
    
    /// Creates a header cell for a table's header row.
    ///
    /// - Parameter data: The title for the data contained in the following cells.
    public init(with data: String) {
        self.cellHeader = UIElement(element: .th)
        self.cellHeader.add(data)
    }
}

/// Handles the cell of a row in an HTML table.
open class UITableCell {
    
    /// The cell that contains the data for the table.
    public let cell: UIElement
    
    /// Creats a HTML table row cell.
    ///
    /// - Parameter data: The data that the cell will contain.
    public init(with data: String) {
        self.cell = UIElement(element: .td)
        self.cell.add(data)
    }
}
