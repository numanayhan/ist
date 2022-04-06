import UIKit

var rooter:Navigation?
var isDark = false {
    didSet {
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        Thread.sleep(forTimeInterval: 0.0)
        
        #if targetEnvironment(simulator)
          setNavigationTest()
        #else
          setNavigationApp()
        #endif
         
        
        
        return true
    }
    // Geliştirici veya Test Kullanıcısı için router değiştirilmesi yapılabilir.
    
    func setNavigationTest(){
        
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        rooter = Navigation(window: window!)
        rooter?.startTestApp()
        
    }
    // Son Kullanıcı için Uygulama Router ile düzenlenir.
    func setNavigationApp(){
        //Window UI
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        //Root App
        rooter = Navigation(window: window!)
        rooter?.startTestApp()
    }
}
