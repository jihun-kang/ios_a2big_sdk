//
//  Stack.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 11. 16..
//  Copyright © 2016년 a2big. All rights reserved.
// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Stack/Stack.swift
//

public struct Stack<T> {
    //fileprivate var array = [T]()
    public var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator {
            _ -> T? in
            return curr.pop()
        }
    }
}
