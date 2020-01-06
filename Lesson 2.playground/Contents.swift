import Foundation

extension BinaryInteger {
    /// Generates binary representation of integer
    /// Ex. UInt16(7) -> 00000000 00000111
    var binaryDescription: String {
        return (0..<self.bitWidth).reduce("") { (result, index) -> String in
            let spacing = index % 8 == 0 ? " " : ""
            return "\((self >> index) & 1)\(spacing)\(result)"
        }
    }
    /// Generates byte representation of integer
    /// Ex. UInt8(28) -> 1c (hex)
    var byteDescription: String {
        let byteRange = 0..<(self.bitWidth / 8)
        return byteRange.reduce("") { (result, index) -> String in
            String(format: "%02x %@", Int((self >> (index * 8))) & 0xff, result)
        }
    }
}

let a = UInt8(200)
Int(a) + 100

0b1010
10
0x0A

// UInt8 0...255
// Int8  -128...127
UInt8(128).binaryDescription
Int8(127).binaryDescription
Int8(-128).binaryDescription

UInt8(255).binaryDescription
let b = UInt8(255)
let c = Int8(bitPattern: b)
UInt8(bitPattern: c)


UInt8(250).byteDescription

UInt16(bigEndian: 0xff00)
UInt16(littleEndian: 0x00ff)
UInt16(0x00ff)

var dataVal = Int32(0x0A_0B_0C_0D).bigEndian
let bufferPointer = UnsafeRawBufferPointer(start: &dataVal, count: MemoryLayout.size(ofValue: dataVal))

for element in bufferPointer {
    print(String(element, radix: 16))
}

let largerInt = 0xff03
UInt8(truncatingIfNeeded: largerInt)

var value = UInt8(255)
value &+= 1
UInt8(0) &- 1

let bits = 0b00110
bits >> 2 //0b00001
bits << 2 //0b11000
bits | 0b001
bits & 0b00100

UInt8(exactly: 255)
UInt8(exactly: 256)

Int8(16).multipliedReportingOverflow(by: 8)
