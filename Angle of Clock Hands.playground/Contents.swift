import UIKit
import Foundation


// there must be a colon
func clockHandAngle1(time: String) -> Int? {
    
    let array = time.components(separatedBy: ":")
    guard var hours = Int(array[0]) else { return nil }
    guard let minutes = Int(array[1]) else { return nil }
    
    if hours > 12 { hours -= 12 }
    
    var angle = (minutes * 6) - (hours * 5 * 6)
    
    if angle < 0 { angle += 360 }
    if angle > 180 { angle = 360 - angle }
    
    return angle
}

// handles both if there is and is not a colon
func clockHandAngle2(time: String) -> Int? {
    var time = time
    
    if !time.contains(":") {
        time.insert(":", at: time.index(time.startIndex, offsetBy: 2))
    }
    
    let array = time.components(separatedBy: ":")
    guard var hours = Int(array[0]) else { return nil }
    guard let minutes = Int(array[1]) else { return nil }
    
    if hours > 12 { hours -= 12 }
    
    var angle = (minutes * 6) - (hours * 5 * 6)
    
    if angle < 0 { angle += 360 }
    if angle > 180 { angle = 360 - angle }
    
    return angle
}

var angle = clockHandAngle1(time: "14:15")
print(angle)
