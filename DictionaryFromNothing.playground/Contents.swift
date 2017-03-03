struct Dictionary: CustomStringConvertible {
    
    private var array: [(String, Any)] = []
    
    var description: String { return "\(self.array)" }
    var first: Any? { return self.array[0] }
    var last: Any? { return self.array[self.count - 1] }
    var isEmpty: Bool { return self.count == 0 }
    
    var count: Int {
        var count = 0
        for _ in self.array { count += 1 }
        return count
    }
    
    mutating func update(_ value: Any?, forKey key: String) {
        if value == nil {
            self.array.remove(at: self.findIndexOf(key ))
        } else if self.lookUp(forKey: key ) != nil {
            self.array[self.findIndexOf(key)] = (key, value!)
        } else {
            self.array.append(key, value!)
        }
    }
    
    func lookUp(forKey key: String) -> Any? {
        for item in self.array {
            if item.0  == key { return item.1 }
        }
        return nil
    }
    
    mutating func removeFirst() { self.update(nil, forKey: self.array[0].0) }

    mutating func removeLast() { self.update(nil, forKey: self.array[self.count - 1].0)}
    
    mutating func removeAll() {
        for item in self.array {
            self.update(nil, forKey: item.0)
        }
    }
    
    private func findIndexOf(_ key: String) -> Int {
        var itemIndex = 0
        for item in self.array {
            if item.0 == key { break }
            else { itemIndex += 1 }
        }
        return itemIndex
    }
}

class MyObject {
    var number = 234
    var letter = "A"
}

let myObject = MyObject()
let myOtherObject = MyObject()

var myDictionary = Dictionary()

print("Is Empty Test #1: \(myDictionary.isEmpty)")
myDictionary.update("Bill", forKey: "Brancato") // add value test
print("Add Value Test: \(myDictionary)")
print("Is Empty Test #2: \(myDictionary.isEmpty)")
myDictionary.update("Adam", forKey: "Brancato") // update value Test
print("Update Value Test: \(myDictionary)")
myDictionary.update(nil, forKey: "Brancato") // remove value test
print("Remove Value Test: \(myDictionary)")
myDictionary.update(1, forKey: "Brancato") // add multiple types test #1
print("Add Multiple Types Test #1: \(myDictionary)")
myDictionary.update(true, forKey: "Flatiron is Fun & Educational") // add multiple types test #2
print("Add Multiple Types Test #2: \(myDictionary)")
myDictionary.update(myObject, forKey: "My Object") // add object test #1
print("Add Object Test #1: \(myDictionary)")
myDictionary.update(myOtherObject, forKey: "My Other Object") // add object test #2
print("Add Object Test #2: \(myDictionary)")
print("Count Test: \(myDictionary.count)") // count test
print("First Value Test: \(myDictionary.first)")
print("Last Value Test: \(myDictionary.last)")
print("Look Up Value Test: \(myDictionary.lookUp(forKey: "Brancato"))")
myDictionary.removeFirst() // remove first item test
print("Remove First Item Test: \(myDictionary)")
myDictionary.removeLast() // remove last item test
print("Remove Last Item Test: \(myDictionary)")
myDictionary.removeAll() // remove all test
print("Remove All Test: \(myDictionary)")


var dictionary : [String: String] = ["Brancato" : "Bill", "Kerr" : "Johann"]
