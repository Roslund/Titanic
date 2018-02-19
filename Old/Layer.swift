//
//  Layer.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-15.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

class Layer {
    var weights: [Double] = []
    let inputSize: Int
    let outputSize: Int
    
    init (inputSize: Int, outputSize: Int) {
        self.inputSize = inputSize
        self.outputSize = outputSize
        weights.reserveCapacity(inputSize * outputSize)

        // Initiate the weights, hopfully with a mean of 0
        for i in 0 ..< inputSize * outputSize {
            weights[i] = random(-1.0 ... 1.0)
        }
    }
}

extension Layer {
    func guess(_ data: [Double]) -> [Double]{
        var guess = [Double](repeating: 0.0, count: outputSize)
        
        for i in 0 ..< outputSize {
            for (j, data) in data.enumerated() {
                guess[i] += (data * weights[i * inputSize + j])
            }
        }

        return sigmoid(guess)
    }
}

extension Layer {
    func train(_ guess: [Double], learningRate: Double) -> [Double]{

    }
}


