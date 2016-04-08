//
//  calcFunctions.swift
//  Calculator-v2
//
//  Created by Tanner on 4/7/16.
//  Copyright © 2016 Tanner. All rights reserved.
//
//  Functions needed in the Calculator and More assignment

import Foundation

// A generic "math operation" function that takes in two Doubles and passes them to a given function,
// returning the resulting Double
func mathOp(leftOperator: Double, rightOperator: Double, op: (Double, Double) -> Double) -> Double {
    return op(leftOperator, rightOperator);
}

// An addition function that takes in two Doubles and returns the sum of both as a Double
func additionOp(leftOperator: Double, rightOperator: Double) -> Double {
    return (leftOperator + rightOperator);
}

// A subtraction function that takes in two Doubles and returns the difference of both as a Double
func subtractionOp(leftOperator: Double, rightOperator: Double) -> Double {
    return (leftOperator - rightOperator);
}

// A multiplication function that takes in two Doubles and returns the product of both as a Double
func multiplicationOp(leftOperator: Double, rightOperator: Double) -> Double {
    return (leftOperator * rightOperator);
}

// A division function that takes in two Doubles and returns the quotient of both as a Double
func divisionOp(leftOperator: Double, rightOperator: Double) -> Double {
    return (leftOperator / rightOperator);
}

// A mod function that takes in two Doubles and returns the mod of the first mod the second as a Double
func modOp(leftOperator: Double, rightOperator: Double) -> Double {
    return (leftOperator % rightOperator);
}

// A generic "array operation" function that takes in an array of doubles and passes them to a given function,
// returning the resulting Double
func arrayOp(doubleArray: [Double], op: ([Double]) -> Double) -> Double {
    return op(doubleArray);
}

// An addition function that takes in an array of Doubles and returns the sum of each Double in the array as
// A single Double
func addArrayOp(doubleArray: [Double]) -> Double {
    return doubleArray.reduce(0, combine: +);
}

// A multiplication function that takes in an array of Doubles and returns the product of each Double in the array as
// A single Double
func multArrayOp(doubleArray: [Double]) -> Double {
    return doubleArray.reduce(1.0, combine: *);
}

// A counting function that takes in an array of Doubles and returns the count of how many elements were in the 
// array passed in as a single Double
func countArrayOp(doubleArray: [Double]) -> Double {
    return Double(doubleArray.count);
}

// An averaging function that takes in an array of Doubles and returns the average of the Doubles in the array
// passed in
func avgArrayOp(doubleArray: [Double]) -> Double {
    let sum = addArrayOp(doubleArray);
    return sum / Double(doubleArray.count);
}

// Adds two points together given two tuples made of the form (Int, Int) and returns the resultingtuple of the same form
func pointAddition(pointOne: (x: Int, y: Int), pointTwo: (x: Int, y: Int)) -> (x: Int, y: Int) {
    return (nilToZero(pointOne.x) + nilToZero(pointTwo.x), nilToZero(pointOne.y) + nilToZero(pointTwo.y));
}

// Adds two points together given two tuples made of the form (Int, Int) and returns the resultingtuple of the same form
func pointSubtraction(pointOne: (x: Int, y: Int), pointTwo: (x: Int, y: Int)) -> (x: Int, y: Int) {
    return (pointOne.x - pointTwo.x, pointOne.y - pointTwo.y);
}

// Adds two given Dictionaries with the keys being String and the values being Doubles
func dictAddition(dictOne: Dictionary<String, Double>, dictTwo: Dictionary<String, Double>) -> Dictionary<String, Double> {
    let safeDictOne = dictNilToZero(dictOne);
    let safeDictTwo = dictNilToZero(dictTwo);
    let finalDict = [
        "x" : safeDictOne["x"]! + safeDictTwo["x"]!,
        "y" : safeDictOne["y"]! + safeDictTwo["y"]!,
    ]
    return finalDict;
}

// Subtracts two given Dictionaries with the keys being String and the values being Doubles
func dictSubtraction(dictOne: Dictionary<String, Double>, dictTwo: Dictionary<String, Double>) -> Dictionary<String, Double> {
    let safeDictOne = dictNilToZero(dictOne);
    let safeDictTwo = dictNilToZero(dictTwo);
    let finalDict = [
        "x" : safeDictOne["x"]! - safeDictTwo["x"]!,
        "y" : safeDictOne["y"]! - safeDictTwo["y"]!,
    ]
    return finalDict;
}

// Takes in an optional Int and returns an Int, changing the value nil to 0
func nilToZero(optional: Int?) -> Int {
    if optional != nil {
        return optional!;
    } else {
        return 0;
    }
}

// Takes a given dictionary with the keys being Strings and the values being Doubles. It returns a new Dictionary with the
// given values for "x" and "y", or zero if they are not set
func dictNilToZero(dict: Dictionary<String, Double>) -> Dictionary<String, Double> {
    var noNilDict = [
        "x": 0.0,
        "y": 0.0,
    ];
    let dictX = dict["x"];
    let dictY = dict["y"];
    if dict["x"] != nil {
        noNilDict["x"] = dictX;
    }
    if dict["y"] != nil {
        noNilDict["y"] = dictY;
    }
    return noNilDict;
}
