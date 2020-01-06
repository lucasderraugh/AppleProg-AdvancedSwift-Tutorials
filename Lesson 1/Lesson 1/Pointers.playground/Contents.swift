import Foundation

// Scalar Value
let memSimple = MemoryLayout<Int64>.self
memSimple.size
memSimple.stride
memSimple.alignment


// Complex Value
struct GameBoard {
    var p1Score: Int32
    var p2Score: Int32
    var gameOver: Bool
}

MemoryLayout<Int32>.size
MemoryLayout<Bool>.size
let memComplex = MemoryLayout<GameBoard>.self
memComplex.size
memComplex.stride
memComplex.alignment
