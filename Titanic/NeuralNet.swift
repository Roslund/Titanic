//
//  NeuralNet.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-15.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

class NeuralNet {
    var weights1: Matrix
    var weights2: Matrix
    
    init(inputSize: Int, hiddenSize: Int, outputSize: Int) {
        weights1 = Matrix.random(rows: inputSize, columns: hiddenSize, range: -1.0 ... 1.0)
        weights2 = Matrix.random(rows: hiddenSize, columns: outputSize, range: -1.0 ... 1.0)
    }
}

extension NeuralNet {
    func guess(_ input: Matrix) -> Matrix {
        let hidden = sigmoid(input  <*> weights1)
        let output = sigmoid(hidden <*> weights2)
        return output
    }
}


extension NeuralNet {
    func train(input: Matrix, awnser: Matrix) {
        
        let hidden = sigmoid(input  <*> weights1)
        let output = sigmoid(hidden <*> weights2)
        
        // Miguel says "use 0.25 and 0.75 as a target value" I don't...
        let normalawnser = awnser[0,0] > 0.0 ? 1.0 : 0.0
        
        let output_error = Matrix([normalawnser]) - output
        let output_delta = output_error * sigmoidDer(output)
        let hidden_error = output_delta <*> (weights2′)
        let hidden_delta = hidden_error * sigmoidDer(hidden)
        
        weights1 += input′  <*> (hidden_delta)
        weights2 += hidden′ <*> (output_delta)
    }
}
