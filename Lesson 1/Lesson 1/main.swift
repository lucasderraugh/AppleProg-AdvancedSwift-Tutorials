//
//  main.swift
//  Lesson 1
//
//  Created by Lucas Derraugh on 9/4/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Foundation

// C Strings
let count = 4
let stride = MemoryLayout<CChar>.stride
let alignment = MemoryLayout<CChar>.alignment
let byteCount = stride * count

let mutableRawPtr = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
defer {
    mutableRawPtr.deallocate()
}

mutableRawPtr.storeBytes(of: 76, as: CChar.self)                          // L
mutableRawPtr.advanced(by: stride).storeBytes(of: 117, as: CChar.self)    // u
mutableRawPtr.advanced(by: stride * 2).storeBytes(of: 99, as: CChar.self) // c
mutableRawPtr.advanced(by: stride * 3).storeBytes(of: 0, as: CChar.self)  // \0

let rawBufferPointer = UnsafeRawBufferPointer(start: mutableRawPtr, count: byteCount)
for (index, byte) in rawBufferPointer.enumerated() {
    print("\(index): \(byte)")
}

let mutablePtr = mutableRawPtr.bindMemory(to: CChar.self, capacity: count)

print(String(cString: mutablePtr))



// Reading from stdin
let inputCapacity = 30
let input = UnsafeMutablePointer<CChar>.allocate(capacity: inputCapacity)
defer {
    input.deallocate()
}
print("Enter text: ", terminator: "")
fgets(input, Int32(inputCapacity), stdin)

print(String(cString: input))



// GameBoard
//let gameBoardPtr = UnsafeMutablePointer<GameBoard>.allocate(capacity: 1)
//gameBoardPtr.initialize(to: GameBoard(p1Score: 20, p2Score: 1))
//defer {
//    gameBoardPtr.deinitialize(count: 1)
//    gameBoardPtr.deallocate()
//}

var gameBoard = GameBoard(p1Score: 20, p2Score: 1)

if let gameText = CreateCurrentScoreText(&gameBoard) {
    print(String(cString: gameText))
    
    gameText.deallocate()
}
