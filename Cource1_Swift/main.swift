//
//  main.swift
//  Cource1_Swift
//
//  Created by Ivan Okhota on 19.10.2021.
//

import Foundation

// enum для автомобилей

enum EngineStatus: String {
    case start = "Включен", stop = "Выключен"
}

enum PetrolStatus: String {
    case full = "Полный", medium = "Половина", empty = "Пустой"
}

enum Windows: String {
    case open = "Открыты", closed = "Закрыты"
}

enum TrunkFillness: String {
    case full = "Полный", empty = "Пустой"
}

enum IgnitionsStatus : String {
    case start, noIgnition
}

// В SportCar все данные внесены сразу

struct SportCar {
    private let brand : String = "BMW"
    private let year : Int = 2021
    private let trunkVolume : Double = 2000.0
    private let horsePower : Int = 192
    private let engineStatus : EngineStatus = .start
    private let petrolStatus : PetrolStatus = .full
    private var windows : Windows = .open
    private let trunkFilness : TrunkFillness = .empty
    
    func carInformation() -> String {
        let carInformation =
        "Марка - \(brand) \nГод производства - \(year)" +
        "\nОбъем багажника - \(trunkVolume) \nМощность - \(horsePower)" +
        " \nСтатус двигателя - \(engineStatus.rawValue)" +
        " \nСтатус бензобака - \(petrolStatus.rawValue)" +
        " \nСтатус окон - \(windows.rawValue)" +
        " \nЗаполненость багажника - \(trunkFilness.rawValue)"
        return carInformation
    }
}

let car1 = SportCar()
print ("Инфомарция о легковом автомобиле \n\(car1.carInformation())\n")

// Запуск автомобиля. Cледуйсте информации в консоле.

print ("*** Поробуем запустить автомобиль ***")
print ("Введите информацию о автомобиле")
print ("Введите марку автомобиля")
var carBrand : String = readLine() ?? ""
print ("Введите год автомобиля")
var carYear : String = readLine() ?? ""
print ("Введите мощность автомобиля, л/с")
var carHorsePower : String = readLine() ?? ""

struct TrukCar {
    private let brand : String = carBrand
    private let year : String = carYear
    private let horsePower : String = carHorsePower
    var engineStatus : EngineStatus
    var petrolStatus : PetrolStatus {
        willSet {
            if newValue == .empty {
                print ("Бензин закончился")
            } else if newValue == .full {
                print ("Бензобак - полон")
            } else {
                print ("Бензин еще есть")
            }
        }
    }
    var windows : Windows = .open {
        willSet {
            if newValue == .open{
                print ("Открыты")
            } else {
                print ("Закрыты")
            }
        }
    }
    var ignitionStatus : IgnitionsStatus = .noIgnition {
        willSet {
            if newValue == .start {
                print ("Внимание! Двигатель запущен")
            } else {
                print ("Двигатель выключен")
            }
        }
    }
    func startTruck () -> String {
        switch engineStatus {
        case .start : print ("Поехали!")
        default : print ("Двигатель не запущен")
        }
        switch petrolStatus {
        case .empty : print ("Бак пуст")
        case .medium : print ("Бензин есть, но бак не полный")
        default : print ("Бак полный")
        }
        return ""
    }
    func carInformation() -> String {
        let carInformation =
        "Марка - \(brand)" +
        "\nГод производства - \(year)" +
        "\nМощность - \(horsePower)"
        return carInformation
    }
}

var car2 = TrukCar(engineStatus: .stop, petrolStatus: .empty)

print (car2.startTruck())

print ("Для того, что бы заправить автомобиль введите Заправить")
var exitStart = false
while car2.petrolStatus != .full && exitStart != true {
    let petrolRefill : String? = readLine() ?? " "
    switch petrolRefill {
    case "Заправить" : car2.petrolStatus = .full
    case "Выход" : print ("Машина не заведена") ; exitStart = true
    default : print ("Введите Заправить или Выход")
    }
}
print (car2.startTruck())

print ("Для того, что бы включить зажигание введите Зажигание")
if car2.petrolStatus == .full {
    while car2.ignitionStatus != .start && exitStart != true {
        let Ignite : String? = readLine() ?? " "
        switch Ignite {
        case "Зажигание" : car2.ignitionStatus  = .start
        case "Выход" : print ("Машина не заведена") ; exitStart = true
        default : print ("Введите Зажигание или Выход")
        }
    }
}
