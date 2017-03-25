//
//  ViewController.swift
//  TileShiftView
//
//  Created by Tomoya Hirano on 11/20/2016.
//  Copyright (c) 2016 Tomoya Hirano. All rights reserved.
//

import UIKit
import TileShiftView

final class ViewController: UIViewController {
  @IBOutlet private weak var tileShiftView: TileShiftView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tileShiftView.prepare(with: [#imageLiteral(resourceName: "artwork_sample_00000"),
                            #imageLiteral(resourceName: "artwork_sample_00001"),
                            #imageLiteral(resourceName: "artwork_sample_00002"),
                            #imageLiteral(resourceName: "artwork_sample_00003"),
                            #imageLiteral(resourceName: "artwork_sample_00004"),
                            #imageLiteral(resourceName: "artwork_sample_00005"),
                            #imageLiteral(resourceName: "artwork_sample_00006"),
                            #imageLiteral(resourceName: "artwork_sample_00007"),
                            #imageLiteral(resourceName: "artwork_sample_00008")])
    tileShiftView.rotation = 15.0
    tileShiftView.isEnabledBorder = true
    tileShiftView.borderWidth = 3.0
    tileShiftView.borderColor = UIColor.red
    tileShiftView.ignoreIndecies = [4]
  }
}

