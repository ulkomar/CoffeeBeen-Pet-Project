//
//  OnboardingViewController.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 2.11.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
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
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .gray
        
        return scrollView
    }()
    
    //MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print( self.responderChain() )
    }
    
    //MARK: - Private methods
    
    private func setupSubviews() {
        // set up scrolling pages
        self.view.addSubview(scrollView)
        setupPage(toScrollView: scrollView, toPage: 0, imageName: "onboarding1")
        setupPage(toScrollView: scrollView, toPage: 1, imageName: "onboarding2")
        setupPage(toScrollView: scrollView, toPage: 2, imageName: "onboarding3")
        
    }
    
    private func setupPage(toScrollView scView: UIScrollView, toPage pageNum: Int, imageName image: String) {
        let frame = CGRect(x: scView.frame.width * CGFloat(pageNum), y: 0, width: scView.frame.width, height: scView.frame.height)
        guard let image = UIImage(named: image) else {
            return
        }
        
        let page = UIView(frame: frame)
        let cgIm = image.cgImage
        page.layer.contents = cgIm
        page.backgroundColor = UIColor(patternImage: image)
        page.contentMode = .scaleAspectFill
        page.clipsToBounds = true
        
        let stackView = setupStackViewForPage(pageNumber: pageNum)

        page.addSubview( stackView )
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: page.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: page.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: page.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        scView.addSubview(page)
    }
    
    private func setupStackViewForPage(pageNumber num: Int) -> UIStackView {
        let stackView = UIStackView()
        
        let label = UILabel()
        label.text = screenInformation.getScreenInformation(index: num)[1]
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 3

        let label1 = UILabel()
        label1.text = screenInformation.getScreenInformation(index: num)[0]
        label1.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        label1.textColor = .white
        label1.numberOfLines = 3
        
        let button = UIButton()
        button.setTitle(screenInformation.getScreenInformation(index: num)[2], for: .normal)
        button.backgroundColor = UIColor(red: 16/255, green: 149/255, blue: 102/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(getprint), for: .touchUpInside)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.center = self.view.center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        return stackView
    }
    
    private func setupConstraints() {
       
    }
    
    @objc func getprint(_ sender: UIButton) {
        print("hello")
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
