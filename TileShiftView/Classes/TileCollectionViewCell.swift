//
//  TileCollectionViewCell.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/11/20.
//
//

import UIKit

final class TileCollectionViewCell: UICollectionViewCell {
  private struct Const {
    static let Padding: CGFloat = 5.0
  }
  
  private var imageView = UIImageView()
  var isEnabledBorder = false
  var borderWidth: CGFloat = 1.0
  var borderColor: UIColor = UIColor.lightGray
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubviews()
    setupAppearance()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupSubviews()
    setupAppearance()
  }
  
  private func setupSubviews() {
    imageView.backgroundColor = UIColor.lightGray
    contentView.addSubview(imageView)
  }
  
  private func setupAppearance() {
    imageView.alpha = 0.0
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 5.0
    imageView.layer.masksToBounds = true
  }
  
  func startAnimation(with image: UIImage?) {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: .allowAnimatedContent, animations: { [weak self] in
      self?.imageView.alpha = 0.0
    }) { [weak self] (_) in
      self?.imageView.image = image
      self?.imageView.transform = CGAffineTransform(translationX: 44.0, y: 0.0)
      UIView.animate(withDuration: 0.5, delay: 0.0, options: [.allowAnimatedContent, .curveEaseInOut], animations: { [weak self] in
        self?.imageView.transform = CGAffineTransform.identity
        self?.imageView.alpha = 1.0
      })
    }
  }
  
  func hideAnimation() {
    UIView.animate(withDuration: 0.5) { [weak self] in
      self?.imageView.alpha = 0.0
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if isEnabledBorder {
      imageView.layer.borderWidth = borderWidth
      imageView.layer.borderColor = borderColor.cgColor
    }
    imageView.frame = CGRect(x: Const.Padding,
                             y: Const.Padding,
                             width: bounds.width - Const.Padding * 2.0,
                             height: bounds.height - Const.Padding * 2.0)
  }
}
