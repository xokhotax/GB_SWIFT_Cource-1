//
//  main.swift
//  Cource1_Swift
//
//  Created by Ivan Okhota on 26.10.2021.
//

import Foundation

// MARK: -
// 1. Создать протокол «Car» и описать свойства, общие для автомобилей,
// а также метод действия.
// 2. Создать расширения для протокола «Car» и реализовать в них методы
// конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить
// двигатель и т.д. (по одному методу на действие, реализовывать следует только
// те действия, реализация которых общая для всех автомобилей).
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar.
// Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
// 4. Для каждого класса написать расширение, имплементирующее протокол
// CustomStringConvertible.
// 5. Создать несколько объектов каждого класса. Применить к ним
// различные действия.
// 6. Вывести сами объекты в консоль.

enum CarType: String {
  case sport = "Спортивный"
  case suv = "SUV"
  case trunkcar = "Седан"
  case hatch = "Хечбек"
  case mini = "Мини"
  case truck = "Грузовик"
}

enum Transmission: String {
  case manual = "Механика"
  case auto = "Автоматическая"
}

enum DoorsStatus: String {
  case open = "Открыты"
  case closed = "Закрыты"
}

enum WindowsStatus: String {
  case open = "Открыты"
  case closed = "Закрыты"
}

enum TrunkStatus: String {
  case full = "Полон"
  case empty = "Пустой"
}

enum PetrolTunkStatus: String {
  case full = "Полон"
  case empty = "Пустой"
}

enum SpareWheelAvailability: String {
  case available = "Есть"
  case missed = "Отсутствует"
}

enum CarAudio: String {
  case available = "Есть"
  case missed = "Отсутствует"
}

enum UnloadingPlatform: String {
  case available = "Есть"
  case missed = "Отсутствует"
}

enum AirDeflector: String {
  case available = "Есть"
  case missed = "Отсутствует"
}

enum Ignition: String {
  case ignitionON = "Двигатель заправлен"
  case ignitionOff = "Двигатель выключен"
}


protocol DefaultCar {
  var carBrand: String { get set }
  var carType: CarType { get set }
  var carHorsePower: Double { get set }
  var transmission: Transmission { get set }
  var doorStatus: DoorsStatus { get set }
  var windowsStatus: WindowsStatus { get set }
  var trunkStatus: TrunkStatus { get set }
  var petrolTunkStatus: PetrolTunkStatus { get set }
  var spareWheelAvailability: SpareWheelAvailability { get set }
  var ignition: Ignition { get set }
  //  var carAudio: CarAudio { get set }
  //  var unloadingPlatform: UnloadingPlatform { get set }
  //  var airDeflector: AirDeflector { get set }
  
  func informationPrint()
}

struct StructDefaultCar: DefaultCar {
  var carBrand: String
  var carType: CarType
  var carHorsePower: Double
  var transmission: Transmission
  var doorStatus: DoorsStatus
  var windowsStatus: WindowsStatus
  var trunkStatus: TrunkStatus
  var petrolTunkStatus: PetrolTunkStatus
  var spareWheelAvailability: SpareWheelAvailability
  var ignition: Ignition
  
}

// MARK: - Вывод информации об автомобиле

extension DefaultCar {
  func informationPrint() {
    print ("Бренд - \(carBrand)" +
           "\nТип авто - \(carType.rawValue)" +
           "\nМощность - \(carHorsePower) лс." +
           "\nКоробка передач - \(transmission.rawValue)" +
           "\nСтатус дверей - \(doorStatus.rawValue)" +
           "\nСтатус Окон - \(windowsStatus.rawValue)" +
           "\nСтатус багажника - \(trunkStatus.rawValue)" +
           "\nСтатус бака - \(petrolTunkStatus.rawValue)" +
           "\nНаличие запасного колеса - \(spareWheelAvailability.rawValue)")
  }
}

// MARK: - Действия с дверьми автомобиля

extension DefaultCar {
  mutating func openDoors(doorStatus: DoorsStatus){
    self.doorStatus = doorStatus
    switch doorStatus {
      case .open: print("Двери открыты")
      case .closed: print("Двери закрыты")
    }
    //    return doorStatus
  }
}

// MARK: - Действия с окнами автомобиля

extension DefaultCar {
  mutating func openWindows(windowsStatus: WindowsStatus) {
    self.windowsStatus = windowsStatus
    switch windowsStatus {
      case .open: print("Окна открыты")
      case .closed: print("Окна закрыты")
    }
  }
}

// MARK: - Начало движения
extension DefaultCar {
  mutating func startCar(ignition: Ignition) {
    self.ignition = ignition
    if petrolTunkStatus == .full && doorStatus == .closed {
      self.ignition = .ignitionON
      print("Двигатель запущен!")
    } else{
      print("Двигатель не запущен! Бензобак - \(petrolTunkStatus.rawValue)" +
            " и Двери \(doorStatus.rawValue). \nДля запуска двери должны быть" +
            " закрыты и бензобак - полон")
    }
  }
}

// MARK: - Заполнить бак

extension DefaultCar {
  mutating func refilTank(petrolTunkStatus: PetrolTunkStatus) {
    self.petrolTunkStatus = petrolTunkStatus
    switch petrolTunkStatus {
      case .full: print("Бак заправлен")
      case .empty: print("Бак пуст")
    }
  }
}


var bmw = StructDefaultCar(carBrand: "BMW",
                           carType: .truck,
                           carHorsePower: 120,
                           transmission: .auto,
                           doorStatus: .closed,
                           windowsStatus: .open,
                           trunkStatus: .full,
                           petrolTunkStatus: .empty,
                           spareWheelAvailability: .available,
                           ignition: .ignitionOff)
bmw.informationPrint()
bmw.openWindows(windowsStatus: .closed)

//let a = 0
//a != 0 && a < 0 ? print ("1") : print ("2")

bmw.startCar(ignition: .ignitionON)
bmw.refilTank(petrolTunkStatus: .full)
bmw.openDoors(doorStatus: .closed)
bmw.startCar(ignition: .ignitionON)

