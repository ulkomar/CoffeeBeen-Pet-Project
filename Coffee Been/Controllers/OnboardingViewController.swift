//
//  OnboardingViewController.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 2.11.22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var screenInformation = OnboardingInfo()
    var scrollView = UIScrollView()
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = setupScrollView(mainView: self.view)
        self.view.addSubview(scrollView)
        
        addShadow(toView: view)
        
        
    }
    
    private func setupStackView() {
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
        
        
    }
    
    private func setupScrollView(mainView main: UIView) -> UIScrollView {
        // settings
        let view = UIScrollView()
        let width = main.bounds.width
        let height = main.bounds.height
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let pageNumbers = 3
        
        view.frame = frame
        view.contentSize = CGSize(width: width * CGFloat(pageNumbers), height: height)
        view.isPagingEnabled = true
        view.backgroundColor = .gray
        
        self.setupFirstPage(scrollView: view)
        self.setupSecondPage(scrollView: view)
        self.setupThirdPage(scrollView: view)
        return view
    }
    
    private func setupFirstPage(scrollView: UIScrollView) {
        let frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        let page = UIImageView(frame: frame)
        page.image = UIImage(named: "onboarding4")
        page.contentMode = .scaleAspectFill
        page.clipsToBounds = true
        scrollView.addSubview(page)
        
        
        page.addSubview(stackView)
        setupStackView()
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: page.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: page.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: page.trailingAnchor, constant: 20)
        ])
    }
    
    private func setupSecondPage(scrollView: UIScrollView) {
        let frame = CGRect(x: scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        let page = UIImageView(frame: frame)
        page.image = UIImage(named: "onboarding2")
        page.contentMode = .scaleAspectFill
        page.clipsToBounds = true
        scrollView.addSubview(page)
    }
    
    private func setupThirdPage(scrollView: UIScrollView) {
        let frame = CGRect(x: scrollView.bounds.width * 2, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        let page = UIImageView(frame: frame)
        page.image = UIImage(named: "onboarding3")
        page.contentMode = .scaleAspectFill
        page.clipsToBounds = true
        scrollView.addSubview(page)
    }
    
    private func addShadow(toView: UIView) {
//        let layer = CALayer()
//        layer.backgroundColor = UIColor.black.cgColor
//        layer.frame = toView.frame
//        layer.opacity = 0.3
        let topColor = UIColor.clear.withAlphaComponent(0.1).cgColor
        let bottomColor = UIColor.black.withAlphaComponent(0.7).cgColor
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.9)
        layer.frame = toView.frame
        layer.colors = [topColor, bottomColor]
        layer.transform = CATransform3DMakeRotation(0, 0, 0, 0)
        toView.layer.addSublayer(layer)
    }
    

}
