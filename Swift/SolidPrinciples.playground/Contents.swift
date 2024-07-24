import Foundation

/* SOLID principles */

/* Single responsibility */
/* A class should have only one single responsibility, have one reason to chang.
   One task is assigned and you take care of that to implement task
 */

// User profile manager deals with profile changes related tasks.
class UserProfileManager {
 
    func editProfileImage() {
        
    }
    
    func editUsername() {
        
    }
    
    func resetPassword() {
        // Password manager deals with passwords only
        PasswordManager().resetPassword()
        
    }
    
    func storeMessages() {
        // Store manager deals with storing messages only
        StoreMessagesManager().storeMessages()
    }
}
    
// Password manager deals with passwords only
class PasswordManager {
    func resetPassword() {
        
    }
}

// Store manager deals with storing messages only
class StoreMessagesManager {
    func storeMessages() {
        
    }
}



// Open/Closed principle
/* Object or entities should be open for extension and closed for modification.*/
// Objects or entities - Classes , struct or enum

enum Event {
    case viewLoaded
    case buttonClicked
    case toggle
    case openMenu
}

protocol AnalyticsService {
    func logEvent(event:Event)
}

class FirebaseAnalytics : AnalyticsService {
 
    func logEvent(event: Event) {
        
    }
}

class CleverTapAnalytics : AnalyticsService {
    
    func logEvent(event: Event) {
        
    }
}

class MixPanelAnalytics : AnalyticsService {
 
    func logEvent(event: Event) {
        
    }
}


final class Logger {

    static let sharedInstance = Logger()
    
    private init() {}
    
    func log(service:AnalyticsService, event: Event) {
        service.logEvent(event: event)
    }
    
}

let loggerObject = Logger.sharedInstance
loggerObject.log(service: FirebaseAnalytics(), event: .buttonClicked)


// Liskov substitution principle
/* Objects of a superclass shall be replaceable with objects of its subclasses without breaking the application */

class CafeMenuItem {
    func getPrice() {}
    func discountedPrice() {}
}

class Pizza : CafeMenuItem {
    override func getPrice() {
        
    }
}

class Burger: CafeMenuItem {
    override func getPrice() {
        
    }
}

let item = Burger()
item.discountedPrice()


// Interface Segregation
/* No code should be forced to depend on methods it does not use */

protocol LocalStorage {

    func fetchValue(key:String)
    
    func storeValue(key:String)
    
    func deleteValue(key:String)

}

protocol RemoteStorage {
    
    func storeOrder(id:String)
    
    func deleteForUser(id:String)

}


class FirebaseManager : RemoteStorage {
    
    func storeOrder(id: String) {
        
    }
    
    func deleteForUser(id: String) {
        
    }
}

class StoreManager : LocalStorage {
    
    func fetchValue(key: String) {
        
    }
    
    func storeValue(key: String) {
        
    }
    
    func deleteValue(key: String) {
        
    }
}


// Dependency Inversion Principle
/* High level modules should not depend on low level modules. Both should depend on abstractioin. Details should epend on abstraction */

protocol PaymentGateWay {
    func processPayment(amount:Double, completion:@escaping (Result<String,Error>) -> Void)
}

class PaymentManager {
    
    private let paymentGateway: PaymentGateWay

    init(paymentGateway:PaymentGateWay) {
        self.paymentGateway = paymentGateway
    }
    
    func processPayment(amount:Double, completion:@escaping (Result<String,Error>) -> Void) {
        paymentGateway.processPayment(amount: amount, completion: completion)
    }
}

class StripePaymentGateway : PaymentGateWay {

    func processPayment(amount: Double, completion: @escaping (Result<String, any Error>) -> Void) {
     
        completion(.success("Stripe Payment success"))
    }
}

class PaypalPaymentGateway : PaymentGateWay {
    
    func processPayment(amount: Double, completion: @escaping (Result<String, any Error>) -> Void) {
        completion(.success("Paypal Payment success"))
    }
}

let stripePaymentGateway = StripePaymentGateway()
let paypalPaymentGateway = PaypalPaymentGateway()

PaymentManager(paymentGateway: stripePaymentGateway).processPayment(amount: 10000) {  result in
    
    switch result {
        
    case .success(let message):
        print(message)
        
    case .failure(let error):
        print(error)
    }
}
