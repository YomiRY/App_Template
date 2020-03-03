import UIKit
import Firebase
import FirebaseDynamicLinks

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Thread.sleep(forTimeInterval: 3.0)
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        return true
    }
    
    // MARK:- Deep Link
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return application(app, open: url,
                           sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                           annotation: "")
    }
    
    @available(iOS 8.0, *)
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url), let url = dynamicLink.url {
            // Handle the deep link. For example, show the deep-linked content or
            // apply a promotional offer to the user's account.
            // ...
            print("open url = \(String(describing: url.absoluteString.removingPercentEncoding))")
            return true
        }
        return false
    }
    
    // MARK:- Dynamic Link / Universal Link
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let handled = DynamicLinks.dynamicLinks().handleUniversalLink((userActivity.webpageURL)!) { (dynamiclink, error) in
            let url = dynamiclink?.url
            print("continue userActivity = \(String(describing: url?.absoluteString.removingPercentEncoding))")
        }
        
        return handled
    }
    
    //    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
    //        // 1
    //        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
    //            let url = userActivity.webpageURL,
    //            let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
    //                return
    //        }
    //
    //        print("AppTemplate: universal link")
    // 2
    //        if let computer = ItemHandler.sharedInstance.items
    //            .filter({ $0.path == components.path}).first {
    //            presentDetailViewController(computer)
    //            return
    //        }
    
    // 3
    //        if let webpageUrl = URL(string: "http://rw-universal-links-final.herokuapp.com") {
    //            application.open(webpageUrl)
    //        }
    //    }
    
    //    func presentDetailViewController(_ computer: Computer) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //
    //        guard
    //            let detailVC = storyboard
    //                .instantiateViewController(withIdentifier: "DetailController")
    //                as? ComputerDetailController,
    //            let navigationVC = storyboard
    //                .instantiateViewController(withIdentifier: "NavigationController")
    //                as? UINavigationController
    //            else { return }
    //
    //        detailVC.item = computer
    //        navigationVC.modalPresentationStyle = .formSheet
    //        navigationVC.pushViewController(detailVC, animated: true)
    //    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

