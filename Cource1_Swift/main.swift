//
//  main.swift
//  Cource1_Swift
//
//  Created by Ivan Okhota on 24.10.2021.
//

import Foundation

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

// Определение родительского класса автомобиля

class Car {
    private let carBrand: String
    private let carType: CarType
    private let carPower: Double
    private let transmission: Transmission
    private let distance: Double
    private let audio: CarAudio
    private let doorStatus: DoorsStatus
    private var windowsStatus: WindowsStatus{
        willSet {
            switch newValue {
            case .open: print("Окна открыты")
            case .closed: print("Окна закрыты")
            }
        }
    }
    private let trunkStatus: TrunkStatus
    private let petrolTunkStatus: PetrolTunkStatus
    private let spareWheelAvailability: SpareWheelAvailability
    
    init(carBrand: String, carType: CarType, carPower: Double,
         transmission: Transmission, distance: Double, audio: CarAudio,
         doorStatus: DoorsStatus, windowsStatus: WindowsStatus,
         trunkStatus: TrunkStatus, petrolTunkStatus: PetrolTunkStatus,
         spareWheelAvailability : SpareWheelAvailability) {
        self.carBrand = carBrand
        self.carType = carType
        self.carPower = carPower
        self.transmission = transmission
        self.distance = distance
        self.audio = audio
        self.doorStatus = doorStatus
        self.windowsStatus = windowsStatus
        self.trunkStatus = trunkStatus
        self.petrolTunkStatus = petrolTunkStatus
        self.spareWheelAvailability = spareWheelAvailability
    }
    
// Дефолтный вывод описания авто
    
    func printCarInformation() -> String {
        let carStatus = "Бренд - \(carBrand)" +
        "\nТип авто - \(carType.rawValue)" +
        "\nМощность - \(carPower) лс." +
        "\nКоробка передач - \(transmission.rawValue)" +
        "\nПробег - \(distance) км \nМагнитола - \(audio.rawValue)" +
        "\nСтатус дверей - \(doorStatus.rawValue)" +
        "\nСтатус Окон - \(windowsStatus.rawValue)" +
        "\nСтатус багажника - \(trunkStatus.rawValue)" +
        "\nСтатус бака - \(petrolTunkStatus.rawValue)" +
        "\nНаличие запасного колеса - \(spareWheelAvailability.rawValue)"
        return carStatus
    }

// Открытие окон

    func openWindows() {
        windowsStatus = .open
    }
}

// Наследник грузовик

final class TrunkCar: Car {
    private let unloadingPlatform: UnloadingPlatform
    init(carBrand: String, carType: CarType, carPower: Double,
         transmission: Transmission, distance: Double, audio: CarAudio,
         doorStatus: DoorsStatus, windowsStatus: WindowsStatus,
         trunkStatus: TrunkStatus, petrolTunkStatus: PetrolTunkStatus,
         spareWheelAvailability: SpareWheelAvailability,
         unloadingPlatform: UnloadingPlatform) {
        self.unloadingPlatform = unloadingPlatform
        super.init(carBrand: carBrand, carType: carType, carPower: carPower,
                   transmission: transmission, distance: distance, audio: audio,
                   doorStatus: doorStatus, windowsStatus: windowsStatus,
                   trunkStatus: trunkStatus, petrolTunkStatus: petrolTunkStatus,
                   spareWheelAvailability : spareWheelAvailability)
    }
    override func printCarInformation() -> String {
        "\(super.printCarInformation())" +
        "\nНаличие разгрузочной платформы - \(unloadingPlatform.rawValue)"
    }
}

// Наследник спорткар

final class SportCar: Car {
    private let airDeflector: AirDeflector
    init(carBrand: String, carType: CarType, carPower: Double,
         transmission: Transmission, distance: Double, audio: CarAudio,
         doorStatus: DoorsStatus, windowsStatus: WindowsStatus,
         trunkStatus: TrunkStatus, petrolTunkStatus: PetrolTunkStatus,
         spareWheelAvailability: SpareWheelAvailability,
         airDeflector: AirDeflector) {
        self.airDeflector = airDeflector
        super.init(carBrand: carBrand, carType: carType, carPower: carPower,
                   transmission: transmission, distance: distance, audio: audio,
                   doorStatus: doorStatus, windowsStatus: windowsStatus,
                   trunkStatus: trunkStatus, petrolTunkStatus: petrolTunkStatus,
                   spareWheelAvailability : spareWheelAvailability)
    }
    override func printCarInformation() -> String {
        "\(super.printCarInformation())" +
        "\nНаличие антикрыла - \(airDeflector.rawValue)"
    }
}

let truckCar = TrunkCar(carBrand: "Mercedes", carType: .truck, carPower: 200,
                        transmission: .auto, distance: 100, audio: .available,
                        doorStatus: .closed, windowsStatus: .closed,
                        trunkStatus: .empty, petrolTunkStatus: .full,
                        spareWheelAvailability: .available,
                        unloadingPlatform: .available)

let sportCar = SportCar(carBrand: "BMW", carType: .sport, carPower: 300,
                        transmission: .auto, distance: 100, audio: .available,
                        doorStatus: .closed, windowsStatus: .closed,
                        trunkStatus: .empty, petrolTunkStatus: .full,
                        spareWheelAvailability: .missed,
                        airDeflector: .available)

print ("Информация по грузовику\n")
print(truckCar.printCarInformation())
print ("Информация по спорткару\n")
print(sportCar.printCarInformation())

print ("Откроем окна\n")
sportCar.openWindows()

