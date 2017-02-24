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

/// Handles an HTML table element.
open class UITable {
    
    /// The HTML table. I have nothing else to say.
    let table: UIElement
    
    /// The header row for the HTML table.
    var headerRow: UITableRowHeader?
    
    /// The rows of data cells for the table.
    var rows: [UITableRow]
    
    /// Creats a table with rows of data cells and no header.
    ///
    /// - Parameter data: A 2D array of strings that contains the data for the cells. Each sub-array is for a row of cells.
    init(with data: [[String]]) {
        self.table = UIElement(element: .table)
        self.rows = []
        for row in data {
            let newRow = UITableRow(with: row)
            self.rows.append(newRow)
            self.table.add(newRow)
        }
    }
    
    /// Creates a table with a header row and subsequent rows of data cells.
    ///
    /// - Parameters:
    ///   - headerTitles: The titles that will be in the header row's cells.
    ///   - rowsCellData: A 2D array of strings that contains the data for the data cells. Each sub-array is for a row of cells.
    init(with headerTitles: [String], and rowsCellData: [[String]]) {
        self.table = UIElement(element: .table)
        self.rows = []
        
        self.headerRow = UITableRowHeader(with: headerTitles)
        self.table.add(headerRow ?? UITableRowHeader(with: []))
        for row in rowsCellData {
            let newRow = UITableRow(with: row)
            self.rows.append(newRow)
            self.table.add(newRow)
        }
    }
}

/// A row in an HTML table.
open class UITableRow {
    
    /// The row that contains the table cells.
    public let row: UIElement
    
    /// The cells that contain the data for the table.
    public var cells: [UITableCell]
    
    /// Creates a row for an HTML table with cells containing data.`
    ///
    /// - Parameter data: The data that will conatined in the cells in the table row.
    public init(with data: [String]) {
        self.row = UIElement(element: .tr)
        self.cells = []
        
        for string in data {
            let cell = UITableCell(with: string)
            self.cells.append(cell)
            self.row.add(cell)
        }
    }
}

/// A header row in an HTML table.
open class UITableRowHeader {
    
    /// The row that contains the header cells.
    public let rowHeader: UIElement
    
    /// The header cells contained in the header row.
    public var cellHeaders: [UITableCellHeader]
    
    /// Creates a header row with cells for an HTML table.
    ///
    /// - Parameter data: The titles that will be contained in the header cells.
    public init(with data: [String]) {
        self.rowHeader = UIElement(element: .tr)
        self.cellHeaders = []
        
        for string in data {
            let cellHeader = UITableCellHeader(with: string)
            self.cellHeaders.append(cellHeader)
            rowHeader.add(cellHeader)
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

extension UITableRow: ElementRenderable {
    
    /// The row contained in the current `UITableRow`.
    public var topLevelElement: UIElement{
        return self.row
    }
}

extension UITableRowHeader: ElementRenderable {
    
    /// The header row of the current `UITableRowHeader`.
    public var topLevelElement: UIElement {
        return self.rowHeader
    }
}

extension UITableCellHeader: ElementRenderable {
    
    /// The header cell contained in the current instance of `UITableCellHeader`.
    public var topLevelElement: UIElement {
        return self.cellHeader
    }
}

extension UITableCell: ElementRenderable {
    
    /// The cell contained in the current instance of `UITableCell`.
    public var topLevelElement: UIElement {
        return self.cell
    }
}
