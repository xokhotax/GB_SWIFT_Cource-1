//
//  main.swift
//  Cource1_Swift
//
//  Created by Ivan Okhota on 31.10.2021.
//

import Foundation

let baseArray = Array (1 ... 50)

struct Queue<T> {
  var newArray = [T]()
  
  mutating func add(_ item: T) {
    newArray.append(item)
  }
}

// MARK: - Метод высшего порядка .map

extension Queue {
  mutating func multiplyBy(number: Int?) -> [T] {
    let number = number ?? 1
    newArray = newArray.map {$0 as! Int * number as! T}
    return newArray
  }
}

// MARK: - Метод высшего порядка .filter. Уберем все нечетные числа

extension Queue {
  mutating func filter() -> [T] {
    newArray = newArray.filter {$0 as! Int % 2 == 0}
    return newArray
  }
}

// MARK: - Subscript

extension Queue {
  subscript(index: Int) -> Int? {
    get {
      if index <= newArray.count {
        print ("Значение в диапазоне\n")
      } else if index > newArray.count {
        print ("Данное значение вне массива\n")
      }
      return index
    }
  }
}

var modifiedArray = Queue(newArray: baseArray)

print(modifiedArray.newArray)
print(modifiedArray.multiplyBy(number: 3))
print(modifiedArray.filter())

modifiedArray[1]
modifiedArray[30]
