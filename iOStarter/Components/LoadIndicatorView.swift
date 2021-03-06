//
//  LoadIndicatorView.swift
//  iOStarter
//
//  Created by Crocodic MBP-2 on 7/21/18.
//  Copyright © 2018 WahyuAdyP. All rights reserved.
//

import UIKit

class LoadIndicatorView: UIView {

    static let shared: LoadIndicatorView = {
        guard let window = UIApplication.shared.keyWindow else { fatalError("View not loaded") }
        let loadingView = LoadIndicatorView(topView: window, tag: 1323)
        loadingView.isUserInteractionEnabled = true
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        loadingView.activityId.color = UIColor.white
        return loadingView
    }()
    
    private var activityId: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = UIColor.white
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private var topView: UIView?
    
    init() {
        super.init(frame: .zero)
        
        self.isUserInteractionEnabled = false
        self.backgroundColor = UIColor.clear
        
        activityId.color = .gray
        
        setupView()
    }
    
    convenience init(topView: UIView, tag: Int = 1328) {
        self.init()
        
        self.topView = topView
        self.tag = tag
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(activityId)
        activityId.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityId.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    /// Start animation of progress view
    func startAnimating() {
        if activityId.isAnimating {
            return
        }
        
        activityId.stopAnimating()
        activityId.startAnimating()
        
        if let topView = self.topView {
            topView.addSubview(self)
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        }
    }
    
    /// Stop animation of progress view
    func stopAnimating() {
        activityId.stopAnimating()
        self.removeFromSuperview()
    }

}

extension UIView {
    /// Start animating activity indicator in superview of current view
    func startAnimatingIndicator(tag: Int = 1328) {
        let topView = self.superview ?? self
        
        let activityId = LoadIndicatorView(topView: topView, tag: tag)
        if !topView.subviews.contains(where: { $0.tag == tag }) {
            activityId.startAnimating()
        }
    }
    
    /// Stop animating activity indicator in superview of current view
    func stopAnimatingIndicator(tag: Int = 1328) {
        let topView = self.superview ?? self
        
        if let activityId = topView.subviews.first(where: { $0.tag == tag }) as? LoadIndicatorView {
            activityId.stopAnimating()
        }
    }
}
