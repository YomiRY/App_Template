import UIKit
import SideMenu
class SlideMenuNavViewController: SideMenuNavigationController {
    
    private static let SLIDE_MENU_STORYBOARD_NAME = "Menu"
    private static let SLIDE_MENU_VC_STORYBOARD_ID = "slide_menu_vc"
    
    init() {
        let storyBoard = UIStoryboard(name: SlideMenuNavViewController.SLIDE_MENU_STORYBOARD_NAME, bundle: nil)
        let menuVc = storyBoard.instantiateViewController(withIdentifier: SlideMenuNavViewController.SLIDE_MENU_VC_STORYBOARD_ID)
        
        super.init(rootViewController: menuVc)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
