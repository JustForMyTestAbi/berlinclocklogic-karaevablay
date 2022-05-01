//
//  main.swift
//  BerlinClock_OfficeHours
//
//  Created by ablai erzhanov on 01.05.2022.
//

import Foundation


// Decomposition



class BerlinClock {

    init() {
        print("Welcome to BerlinClock Kata")
        getHoursInput()
        getMinutesInput()
        getSecondsInput()
    }

    func getHoursInput() {
        print("Please enter amount of hours :)")
        if let hours = readLine() {

            // MARK: - Just a TimeConverter class -

//            let fiveHoursRow = TimeConverter.getFiveHours(Int(hours)!)
//            let singleHoursRow = TimeConverter.getSingleHours(Int(hours)!)
//            print(fiveHoursRow)
//            print(singleHoursRow)

            // MARK: - Pretty same thing as TimeConverter class but with enum cases -
//            let fiveHours = TimeConverterType.fiveHours(hours: Int(hours)!)
//            print(fiveHours.getBulps())

            // MARK: - Call only one function with specified type -
//            let fiveHoursWIthType = TimeConverterType.getTime(with: .fiveHours(hours: Int(hours)!))
//            print(fiveHoursWIthType)
        }
    }

    func getMinutesInput() {
        print("Please enter amount of minutes :)")
        if let minutes = readLine() {
            let fiveMinutesRow = TimeConverter.getFiveMinutes(Int(minutes)!)
            let singleMinutesRow = TimeConverter.getSingleMinutes(Int(minutes)!)
            print(fiveMinutesRow)
            print(singleMinutesRow)
        }
    }

    func getSecondsInput() {
        print("Please enter amount of seconds :)")
        if let seconds = readLine() {
            let secondsRow = TimeConverter.getSeconds(Int(seconds)!)
            print(secondsRow)
        }
    }

    // FIXME: - Convertion to Int from ReadLine was made by forceUnwrapping, it would be great if you will suggest some solution to avoid force unwrapping -
}


class TimeConverter {
    static func getFiveHours(_ hours: Int) -> [Bool] {
        return getLights(hours / 5, totalCountOfBulps: 4)
    }

    static func getSingleHours(_ hours: Int) -> [Bool] {
        return getLights(hours % 5, totalCountOfBulps: 4)
    }

    static func getFiveMinutes(_ minutes: Int) -> [Bool] {
        return getLights(minutes / 5, totalCountOfBulps: 11)
    }

    static func getSingleMinutes(_ minutes: Int) -> [Bool] {
        return getLights(minutes % 5, totalCountOfBulps: 4)
    }

    static func getSeconds(_ seconds: Int) -> [Bool] {
        var array: [Bool] = []
        seconds % 2 == 0 ? array.append(true) : array.append(false)
        return array
    }

    static func getLights(_ turnedOn: Int, totalCountOfBulps: Int) -> [Bool] {
        let onBulps = Array(repeating: true, count: turnedOn) // [true, true] если часы 14 или 13 или 12 или 11 или 10
        let offBulps = Array(repeating: false, count: totalCountOfBulps - turnedOn) // [false, false]

        return onBulps + offBulps //[true, true, false , false]
    }
}

// Aybek's question
enum TimeConverterType {
    case fiveHours(hours: Int)
    case singleHours(hours: Int)
    case fiveMinutes(minutes: Int)
    case singleMinutes(minutes: Int)
    case seconds(seconds: Int)
}

extension TimeConverterType {
    func getBulps() -> [Bool] {
        switch self {
        case .fiveHours(let hours):
            return getLights(hours / 5, totalCountOfBulps: 4)
        case .singleHours(let hours):
            return getLights(hours % 5, totalCountOfBulps: 4)
        case .fiveMinutes(let minutes):
            return getLights(minutes / 5, totalCountOfBulps: 11)
        case .singleMinutes(let minutes):
            return getLights(minutes % 5, totalCountOfBulps: 4)
        case .seconds(let seconds):
            var array: [Bool] = []
            seconds % 2 == 0 ? array.append(true) : array.append(false)
            return array
        }
    }

    func getLights(_ turnedOn: Int, totalCountOfBulps: Int) -> [Bool] {
        let onBulps = Array(repeating: true, count: turnedOn) // [true, true] если часы 14 или 13 или 12 или 11 или 10
        let offBulps = Array(repeating: false, count: totalCountOfBulps - turnedOn) // [false, false]

        return onBulps + offBulps //[true, true, false , false]
    }



    static func getTime(with type: TimeConverterType) -> [Bool] {
        switch type {
        case .fiveHours(let hours):
            return getLightsForTimeConverterType(hours / 5, totalCountOfBulps: 4)
        case .singleHours(let hours):
            return getLightsForTimeConverterType(hours % 5, totalCountOfBulps: 4)
        case .fiveMinutes(let minutes):
            return getLightsForTimeConverterType(minutes / 5, totalCountOfBulps: 11)
        case .singleMinutes(let minutes):
            return getLightsForTimeConverterType(minutes % 5, totalCountOfBulps: 4)
        case .seconds(let seconds):
            var array: [Bool] = []
            seconds % 2 == 0 ? array.append(true) : array.append(false)
            return array
        }
    }

    static func getLightsForTimeConverterType(_ turnedOn: Int, totalCountOfBulps: Int) -> [Bool] {
        let onBulps = Array(repeating: true, count: turnedOn) // [true, true] если часы 14 или 13 или 12 или 11 или 10
        let offBulps = Array(repeating: false, count: totalCountOfBulps - turnedOn) // [false, false]

        return onBulps + offBulps //[true, true, false , false]
    }
}


let berlinClock = BerlinClock()















































//
//class TimeConverter {
//
//    static func getFiveHours(_ hours: Int) -> [Bool] {
//        return getLights(hours / 5, totalCountOfBulps: 4)
//    }
//
//    static func getSingleHours(_ hours: Int) -> [Bool] {
//        return getLights(hours % 5, totalCountOfBulps: 4)
//    }
//
//    static func getFiveMinutes(_ minutes: Int) -> [Bool] {
//        return getLights(minutes / 5, totalCountOfBulps: 11)
//    }
//
//    static func getSingleMinutes(_ minutes: Int) -> [Bool] {
//        return getLights(minutes % 5, totalCountOfBulps: 4)
//    }
//
//    static func getSeconds(_ seconds: Int) -> [Bool] {
//        if seconds % 2 == 0 {
//            return [true]
//        } else {
//            return [false]
//        }
//    }
//
//    static func getLights(_ turnedOn: Int, totalCountOfBulps: Int) -> [Bool] {
//        let onBulps = Array(repeating: true, count: turnedOn) // [true, true] если часы 14 или 13 или 12 или 11 или 10
//        let offBulps = Array(repeating: false, count: totalCountOfBulps - turnedOn) // [false, false]
//
//        return onBulps + offBulps //[true, true, false , false]
//    }
//}
