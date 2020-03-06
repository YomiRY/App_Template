import Foundation
import UIKit

class DataManager {
    
    static let shared:DataManager = DataManager()
    
    var deeplinkUrl:String?
    
    func routeToTargetVc(segueId:String) {
        if deeplinkUrl == nil {
            return
        }
        
        if let vc = UIApplication.shared.windows.first?.rootViewController {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                vc.performSegue(withIdentifier: segueId, sender: nil)
            }
        }
    }
}
