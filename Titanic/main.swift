//
//  main.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

// Read in the data from file
let (input, awnser) = parseFile(file)

// Create a tupel with the training data
let training: (input: [[Double]], awnser: [Double]) = (Array(input[..<1501]), Array(awnser[..<1501]))

// Create a tupel with the test data
let test: (input: [[Double]], awnser: [Double]) = (Array(input[1501...]), Array(awnser[1501...]))

// Timing
let startTime = CFAbsoluteTimeGetCurrent()
defer {
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed: \(timeElapsed) s.")
}

// Create our neural net
let nn = NeuralNet(inputSize: 3, hiddenSize: 4, outputSize: 1)

for _ in 0 ... 15 {
    for (i, input) in training.input.enumerated() {
        nn.train(input: Matrix(input), awnser: Matrix([training.awnser[i]]))
    }
}

print(nn.weights1)
print(nn.weights2)

var correct = 0.0
var survivedActual = 0.0
var survivedPerdicted = 0.0

for (i, input) in test.input.enumerated() {
    let guess = nn.guess(Matrix(input))
    let survived = guess[0,0] >= 0.5 ? 1.0 : -1.0
    
    print("\(i).\tGuessed: \(survived > 0.0 ? " " : "")\(survived) Awnser: \(test.awnser[i] > 0.0 ? " " : "")\(test.awnser[i]), value: \(guess[0,0])")
    
    if test.awnser[i] == 1.0 { survivedActual += 1.0 }
    if test.awnser[i] == 1.0 && survived == 1.0 { survivedPerdicted += 1.0 }
    if survived == test.awnser[i] { correct += 1.0 }
}
print("Correctness: \(correct/700.0)")
print("Survivors Corrcetly Perdicted  \(survivedPerdicted/survivedActual)")
print("Survived predicted: \(survivedPerdicted) Survived actuavl \(survivedActual)")

