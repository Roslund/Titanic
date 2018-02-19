//
//  Activation.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-15.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

func exp(_ x: Matrix) -> Matrix {
    var m = x
    for r in 0 ..< x.rows {
        for c in 0 ..< x.columns {
            m[r, c] = exp(m[r, c])
        }
    }
    return m
}

func sigmoid(_ x:Double) -> Double {
    return 1/(1+exp(-x))
}

func sigmoid(_ x: [Double]) -> [Double] {
    return x.map({sigmoid($0)})
}

func sigmoid(_ x: Matrix) -> Matrix {
    return 1.0 / (1.0 + exp(-x))
}

func sigmoidDer(_ x:Double) -> Double {
    return x*(1-x)
}

func sigmoidDer(_ x: Matrix) -> Matrix {
    return x*(1-x)
}
