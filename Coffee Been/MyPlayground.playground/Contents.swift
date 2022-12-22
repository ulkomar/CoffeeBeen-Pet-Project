//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
   
    lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "AppIcon")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var titleText: UILabel = {
        let label = UILabel()
        label.text = "Successfully created an account"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 3 
        label.textAlignment = .center
        label.textColor = Colors.black.getColor()
        return label
    }()
    
    lazy var subText: UILabel = {
        let label = UILabel()
        label.text = "After this you can explore our services and enjoy our product. Have fun and enjoy it"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = Colors.gray.getColor()
        return label
    }()
    
    lazy var button: UIButton = getButton(text: "Let's explore", bgColor: .green, textColor: .white, height: 50, border: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: 0, width: 380, height: 700)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(titleText)
        view.addSubview(subText)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            image.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -170)
        ])
        
        titleText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleText.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -300)
        ])
        
        subText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            subText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            subText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 30)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    
    @objc func getSmt() {
        print("Hello")
    }
}



PlaygroundPage.current.liveView = MyViewController()

