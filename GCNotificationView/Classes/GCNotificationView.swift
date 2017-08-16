//
//  GCNotificationView.swift
//  Pods
//
//  Created by Lee Junho on 2017. 8. 11..
//
//

import UIKit

public class GCNotificationView: UIView {
    fileprivate let viewWidth: CGFloat = UIScreen.main.bounds.width
    fileprivate let viewHeight: CGFloat = UIScreen.main.bounds.height
    fileprivate var toastView: UIView!
    fileprivate var messageLabel: UILabel!
    
    static fileprivate var isShowing: Bool = false
    public var yPoint: CGFloat = 0
    public var bgColor: UIColor = UIColor(red: 78 / 255, green: 136 / 255, blue: 207 / 255, alpha: 1.0)
    public var textColor: UIColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0)
    
    public init(yPoint: CGFloat = 0) {
        super.init(frame: .zero)
        
        self.yPoint = yPoint
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GCNotificationView {
    fileprivate func setupView() {
        frame = CGRect(x: 0, y: (viewHeight - 40) - yPoint, width: viewWidth, height: 40)
        backgroundColor = .clear
        clipsToBounds = true
        
        toastView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        toastView.backgroundColor = bgColor
        addSubview(toastView)
    }
    
    fileprivate func setupMessage(message: String) {
        messageLabel = UILabel(frame: CGRect(x: 8, y: 0, width: toastView.bounds.width - 16, height: toastView.bounds.height))
        messageLabel.font = UIFont.systemFont(ofSize: 13.0)
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = 1
        messageLabel.text = message
        
        toastView.addSubview(messageLabel)
    }
}

extension GCNotificationView {
    fileprivate func showAnimation() {
        GCNotificationView.isShowing = true
        toastView.transform = CGAffineTransform(translationX: 0, y: toastView.bounds.height)
        
        UIView.animate(withDuration: 0.3) {
            self.toastView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.layoutIfNeeded()
        }
    }
    
    fileprivate func dismissAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.toastView.transform = CGAffineTransform(translationX: 0, y: self.toastView.bounds.height)
        }) { _ in
            self.removeFromSuperview()
            GCNotificationView.isShowing = false
        }
    }
}

extension GCNotificationView {
    fileprivate func addNotificationView(_ completion: (() -> Void)) {
        guard let keyWindow = UIApplication.shared.keyWindow,
            let rootViewController = keyWindow.rootViewController else {
            return
        }
        
        checkVisibleView(viewController: rootViewController).view.addSubview(self)
        completion()
    }
    
    fileprivate func checkVisibleView(viewController: UIViewController) -> UIViewController {
        var vc = viewController
        if let presentedViewController = viewController.presentedViewController {
            vc = checkVisibleView(viewController: presentedViewController)
        }
        
        return vc
    }
}

extension GCNotificationView {
    public func change(backgroundColor: UIColor) -> GCNotificationView {
        self.bgColor = backgroundColor
        
        return self
    }
    
    public func change(textColor: UIColor) -> GCNotificationView {
        self.textColor = textColor
        
        return self
    }
    
    public func show(message: String) {
        guard !GCNotificationView.isShowing else {
            return
        }
        
        setupView()
        setupMessage(message: message)
        addNotificationView {
            showAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
                self.dismissAnimation()
            }
        }
    }
}
