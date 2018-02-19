//
//  Random.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-15.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

func randomDouble(_ range: ClosedRange<Double>) -> Double {
    let span = range.upperBound - range.lowerBound
    return (Double(arc4random_uniform(UINT32_MAX)) / Double(UINT32_MAX) * span + range.lowerBound)
}
