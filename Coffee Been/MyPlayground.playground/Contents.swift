//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    //MARK: - Properties
    
    var screenInformation = OnboardingInfo()
    let pageNumbers = 3
    
    //MARK: - UIView setups
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        let width = view.bounds.width
        let height = view.bounds.height
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: width * CGFloat(pageNumbers), height: height)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .gray
        
        return scrollView
    }()
    
    //MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print( self.responderChain() )
    }
    
}

extension UIResponder {
    func responderChain() -> String {
    guard let next = next else {
        return String(describing: Self.self)
    }
    return String(describing: Self.self) + " -> " + next.responderChain()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
