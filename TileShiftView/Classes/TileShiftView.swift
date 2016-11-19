
//
//  TileShiftView.swift
//  Pods
//
//  Created by Tomoya Hirano on 2016/11/20.
//
//

import UIKit
import RxSwift

open class TileShiftView: UIView {
  fileprivate struct Const {
    static let Column: Int = 3
    static let Line: Int = 3
    static let Rotation = -30.0
    static let CellIdentifier = "TileCollectionViewCell"
    static let interval: RxTimeInterval = 3.0
  }
  
  private var flowLayout = UICollectionViewFlowLayout()
  private var collectionView: UICollectionView
  private var interval = Observable<Int>.interval(Const.interval, scheduler: MainScheduler.instance)
  private let disposeBag = DisposeBag()
  
  //temp
  private var lastUpdateIndex: Int = 0
  
  //public
  private var images = [UIImage]()
  public var ignoreIndecies = [Int]() {
    didSet {
      reloadAllData()
    }
  }
  
  override init(frame: CGRect) {
    collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
    super.init(frame: frame)
    setupSubviews()
    setupAppearance()
    setupSubscriber()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
    super.init(coder: aDecoder)
    setupSubviews()
    setupAppearance()
    setupSubscriber()
  }
  
  public func prepare(with images: [UIImage]) {
    self.images = images
  }
  
  private func setupSubviews() {
    flowLayout.minimumLineSpacing = 0.0
    flowLayout.minimumInteritemSpacing = 0.0
    collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: Const.CellIdentifier)
    collectionView.isUserInteractionEnabled = false
    collectionView.delegate = self
    collectionView.dataSource = self
    addSubview(collectionView)
  }
  
  private func setupAppearance() {
    collectionView.backgroundColor = UIColor.clear
  }
  
  private func setupSubscriber() {
    interval.subscribe(onNext: { [weak self] (_) in
      guard let nextUpdateIndex = self?.createNextUpdateIndex() else { return }
      self?.reloadCell(index: nextUpdateIndex)
    }).addDisposableTo(disposeBag)
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    resetRotation()
    let lownerLength = min(bounds.width, bounds.height)
    let length: CGFloat = lownerLength * CGFloat(Const.Line)
    collectionView.frame = CGRect(x: -((length - bounds.width) / 2.0),
                                  y: -((length - bounds.height) / 2.0),
                                  width: length,
                                  height: length)
    setupRotation()
    reloadAllData()
  }
  
  private func resetRotation() {
    collectionView.transform = CGAffineTransform.identity
  }
  
  private func setupRotation() {
    collectionView.transform = CGAffineTransform(rotationAngle: CGFloat(Const.Rotation * M_PI / 180.0))
  }
  
  private func createNextUpdateIndex() -> Int {
    let upperBound: Int = Const.Column * Const.Line
    let createRandomIndex = { (_: ()) -> Int in
      return Int(arc4random_uniform(10))
    }
    var next = createRandomIndex()
    while next == lastUpdateIndex {
      next = createRandomIndex()
    }
    lastUpdateIndex = next
    return next
  }
  
  private func pickNextImage() -> UIImage? {
    guard let nextImage = images.first else { return nil }
    images.removeFirst()
    images.append(nextImage)
    return nextImage
  }
  
  private func reloadAllData() {
    collectionView.reloadData()
    collectionView.layoutIfNeeded()
    (0...(Const.Column * Const.Line)).forEach({ [weak self] (index) in
      self?.reloadCell(index: index)
    })
  }
  
  private func reloadCell(index: Int) {
    let nextUpdateIndexPath = IndexPath(row: index, section: 0)
    guard let cell = collectionView.cellForItem(at: nextUpdateIndexPath) as? TileCollectionViewCell else { return }
    if ignoreIndecies.contains(index) {
      cell.hideAnimation()
    } else {
      cell.startAnimation(with: pickNextImage())
    }
  }
}

extension TileShiftView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Const.Column * Const.Line
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.CellIdentifier, for: indexPath)
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:  collectionView.bounds.width  / CGFloat(Const.Column),
                  height: collectionView.bounds.height / CGFloat(Const.Line))
  }
}

