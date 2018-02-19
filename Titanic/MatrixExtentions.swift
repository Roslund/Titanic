//
//  MatrixExtentions.swift
//  minimal
//
//  Created by Anton Roslund on 2018-02-15.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

extension Matrix {
    /// Creates a matrix of random values inside Range.
    public static func random(rows: Int, columns: Int, range: ClosedRange<Double>) -> Matrix {
        var m = zeros(rows: rows, columns: columns)
        for r in 0..<rows {
            for c in 0..<columns {
                m[r, c] = randomDouble(range)
            }
        }
        return m
    }
}
