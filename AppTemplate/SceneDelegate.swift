import UIKit
import FirebaseDynamicLinks

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let userActivity = connectionOptions.userActivities.first {
            self.handDynamicLink(userActivity: userActivity)
        }
    }
    
    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    // MARK:- Deep Link/URL Scheme
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("openURLContexts")
        
        self.handDeepLink(URLContexts: URLContexts)
    }
    
    func handDeepLink(URLContexts: Set<UIOpenURLContext>) {
        let urlContext = URLContexts.first
        
        if let urlOrigin = urlContext?.url
            , let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: urlOrigin)
            , let deeplinkUrl = dynamicLink.url
            , let urlStr = deeplinkUrl.absoluteString.removingPercentEncoding {
            DataManager.shared.deeplinkUrl = urlStr
            print("open url = \(String(describing: urlStr))")
        }
    }
    
    // MARK:- Dynamic Link / Universal Link
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        print("continue userActivity")
        
        self.handDynamicLink(userActivity: userActivity)
    }
    
    func handDynamicLink(userActivity: NSUserActivity) {
        DynamicLinks.dynamicLinks().handleUniversalLink((userActivity.webpageURL)!) { (dynamiclink, error) in
            guard let url = dynamiclink?.url
                , let urlStr = url.absoluteString.removingPercentEncoding else {
                    return
            }
            DataManager.shared.deeplinkUrl = urlStr
            print("continue userActivity = \(String(describing: urlStr))")
        }
    }
}

