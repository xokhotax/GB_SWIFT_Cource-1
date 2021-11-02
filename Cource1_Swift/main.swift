//
//  Created by Ivan Okhota on 02.11.2021.
//

import Foundation

// MARK: - База сериалов

enum Gender: String {
  case actionMovie
  case comedy
  case horror
  case thriller
}

enum SerialBaseCheckError: Error {
  case noSerial
}

enum Availability: String {
  case yes
  case no
}

struct SerialInfo {
  var name: String
  var gender: Gender
  var availability: Availability
}

final class SerialBase {
  private var serial = ["Friends": SerialInfo(name: "Friends",
                                              gender: .comedy,
                                              availability: .yes),
                        "Santa Barbara": SerialInfo(name: "Santa Barbara",
                                                    gender: .thriller,
                                                    availability: .no),
                        "Breaking bad": SerialInfo(name: "Breaking bad",
                                                   gender: .actionMovie,
                                                   availability: .yes)]
  func findSerial(name: String) throws -> (Any) {
    guard let position = serial[name],
          position.availability != .no else {
            throw SerialBaseCheckError.noSerial }
    
    print ("Сериал \(name) есть в базе, приятного просмотра")
    
    return ""
  }
}

let newSerial = SerialBase()

do {
  try print (newSerial.findSerial(name: "Santa Barbara"))
} catch let error {
  print ("\(error.localizedDescription) \n")
}

do {
  try print (newSerial.findSerial(name: "Friends"))
} catch let error {
  print ("\(error.localizedDescription) \n")
}

do {
  try print (newSerial.findSerial(name: "Santa Barbora"))
} catch let error {
  print ("\(error.self) \n")
}
