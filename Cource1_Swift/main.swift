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
var arrayTask3 = Array (0...100)
print ("Массив от 0 ... 100 \n \(arrayTask3) \n")

// Задание 4. Удалить из этого массива все четные числа
// и все числа, которые не делятся на 3.
print ("Задание 4")

for value in arrayTask3 {
    if (value % 2) == 0 {
        arrayTask3.remove(at: arrayTask3.firstIndex(of: value)!)
    }
}
for value in arrayTask3 {
    if (value % 3) != 0 {
        arrayTask3.remove(at: arrayTask3.firstIndex(of: value)!)
    }
}
print ("Массив \(arrayTask3) \n")

// Задание 5. Написать функцию, которая добавляет в массив новое число
// Фибоначи, и добавить при помощи нее 50 элементов

print ("Задание 5")
var massivFibonachi: [Int] = [0, 1]
func fibonachi (n: Int, sumOne: Int, sumTwo: Int, counter: Int) {
    
    if counter == -1 {
        print(1)
    }
    if counter == n - 2 {
        return
    }
    let sum = sumOne + sumTwo
    massivFibonachi.append(sum)
    fibonachi(n: n, sumOne: sumTwo , sumTwo: sum, counter: counter + 1)
}
fibonachi(n: 50, sumOne: 0, sumTwo: 1, counter: 0)
print (" \(massivFibonachi) \n")

//// Задание 6. Заполнить массив из 100 элементов различными простыми числами.
//Натуральное число, большее единицы, называется простым, если оно делится
//только на себя и на единицу. Для нахождения всех простых чисел не больше
//заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//a.    Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b.    Пусть переменная p изначально равна двум — первому простому числу.
//c.    Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
//d.    Найти первое не зачёркнутое число в списке, большее, чем p, и
//      присвоить значению переменной p это число.
//e.    Повторять шаги c и d, пока возможно.

print ("Задание 6")
let maxArrayValue = 100
var arrayTask6: [Int] = Array (2...maxArrayValue)
var p = arrayTask6[0]
while p * p <= maxArrayValue {
    arrayTask6.removeAll(where: {$0 >= p * p && $0.isMultiple(of: p) } )
    p = arrayTask6.first(where: {$0 > p})!
}
print (arrayTask6)

print ("Задание 6. Версия 2. Через функцию.")
func sito (_ n: Int) -> [Int] {
    var arrayTask6 = [Int] (2...n)
    var result: [Int] = []
    while let p = arrayTask6.first {
        result.append(p)
        arrayTask6 = arrayTask6.filter{$0 % p != 0}
    }
    return result
}
print (sito(100))

