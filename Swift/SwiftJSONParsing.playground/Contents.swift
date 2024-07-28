import Foundation

let JSON = """
{
  "name": "John",
  "age" : 100,
  "deparmentName" : "Computer science"
}
"""

struct Student  {
    let name: String
    let age : Int
    let deparmentName : String
}

let jsonData = JSON.data(using:.utf8)!


// JSON Parsing using JSONSerialization
do {
    // make sure this JSON is in the format we expect
    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
        // try to read out a string array
        if let name = json["name"] as? String {
            print(name)
        }
        if let age = json["age"] as? Int {
            print(age)
        }
        if let depName = json["deparmentName"] as? String {
            print(depName)
        }

    }
} catch let error as NSError {
    print("Failed to load: \(error.localizedDescription)")
}


struct CodableStudent : Codable {
    let name: String
    let age : Int
    let deparmentName : String
}

do {
 
    // JSON Parsing using JSONDecoder and Codable protocl
    let studentObject: CodableStudent = try JSONDecoder().decode(CodableStudent.self, from: jsonData)

    print("\(studentObject.name)")
    print("\(studentObject.age)")
    print("\(studentObject.deparmentName)")
}

catch let error as NSError {
    print("Failed to load: \(error.localizedDescription)")
}
