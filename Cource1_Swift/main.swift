//
//  main.swift
//  Cource1_Swift
//
//  Created by Ivan Okhota on 14.10.2021.
//

import Foundation

// Задание 1. Написать функцию, которая определяет, четное число или нет.
// Просто через if не стал писать, так прикольнее получилось. Сложнее читать,
// но прикольный код

print ("Задание 1")
func chetnoe (_ value : Double) -> Double {
(value.truncatingRemainder(dividingBy: 2) == 0) ?
    print ("Число \(value) - Четное \n") :
    print ("Число \(value) - Нечетное \n")
    return value
}
let answer = chetnoe(2)

// Задание 2. Написать функцию, которая определяет,
// делится ли число без остатка на 3. Сделал тут простой вариант.

print ("Задание 2")
func checking (_ value2 : Double) -> Double {
    if value2.truncatingRemainder(dividingBy: 3) == 0 {
      print ("Число \(value2) - Делится на 3 \n")
    } else {
        print ("Число \(value2) - Не делится на 3 \n")
    }
    return value2
}
let result = checking (9)

// Задание 3. Создать возрастающий массив из 100 чисел.
print ("Задание 3")
let task3 = Array (0...100)
print ("Массив от 0 ... 100 \n \(task3) \n")

// Задание 4. Удалить из этого массива все четные числа
// и все числа, которые не делятся на 3.
print ("Задание 4")

