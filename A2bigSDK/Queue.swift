//
//  Queue.swift
//  A2bigSDK
//
//  Created by a2big on 2016. 11. 16..
//  Copyright © 2016년 a2big. All rights reserved.
//


public class Node<T:NSObject> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
}

public class Queue<T:NSObject> {
    var count: Int = 0
    var head: Node<T> = Node<T>()
    var tail: Node<T> = Node<T>()
    
    public init() {
    }
    
    public func isEmpty() -> Bool {
        return self.count == 0
    }
    
    public func getCount() -> Int {
        return self.count
    }
    
    public func enqueue(value: T) {
        let node = Node<T>(value: value)
        if self.isEmpty() {
            self.head = node
            self.tail = node
        } else {
            node.next = self.head
            self.head.prev = node
            self.head = node
        }
        self.count = self.count + 1
    }
    
    public func dequeue() -> T? {
        if self.isEmpty() {
            return nil
        } else if self.count == 1 {
            let temp: Node<T> = self.tail
            self.count = self.count - 1

            return temp.value
        } else {
            let temp: Node<T> = self.tail
            self.tail = self.tail.prev!
            self.count = self.count - 1
            return temp.value
        }
    }
}
