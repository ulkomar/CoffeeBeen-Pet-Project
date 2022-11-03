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
        scrollView.backgroundColor = .gray
        
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        let label = UILabel()
        label.text = screenInformation.getScreenInformation(index: 0)[1]
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 3

        let label1 = UILabel()
        label1.text = screenInformation.getScreenInformation(index: 0)[0]
        label1.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        label1.textColor = .white
        label1.numberOfLines = 3

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.center = self.view.center
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label)
        
        return stackView
    }()
    
    //MARK: - Lifecycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
    //MARK: - Private methods
    
    private func setupSubviews() {
        // set up scrolling pages
        self.view.addSubview(scrollView)
        setupPage(toScrollView: scrollView, toPage: 0, imageName: "onboarding1")
        setupPage(toScrollView: scrollView, toPage: 1, imageName: "onboarding2")
        setupPage(toScrollView: scrollView, toPage: 2, imageName: "onboarding3")
        
        self.view.addSubview(stackView)
    }
    
    private func setupPage(toScrollView scView: UIScrollView, toPage pageNum: Int, imageName image: String) {
        let frame = CGRect(x: scView.frame.width * CGFloat(pageNum), y: 0, width: scView.frame.width, height: scView.frame.height)
        let page = UIImageView(frame: frame)
        page.image = UIImage(named: image)
        page.contentMode = .scaleAspectFill
        page.clipsToBounds = true
        scView.addSubview(page)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
//    private func addShadow(toView: UIView) {
////        let layer = CALayer()
////        layer.backgroundColor = UIColor.black.cgColor
////        layer.frame = toView.frame
////        layer.opacity = 0.3
//        let topColor = UIColor.clear.withAlphaComponent(0.1).cgColor
//        let bottomColor = UIColor.black.withAlphaComponent(0.7).cgColor
//        let layer = CAGradientLayer()
//        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
//        layer.endPoint = CGPoint(x: 0.5, y: 0.9)
//        layer.frame = toView.frame
//        layer.colors = [topColor, bottomColor]
//        layer.transform = CATransform3DMakeRotation(0, 0, 0, 0)
//        toView.layer.addSublayer(layer)
//    }
    

}
