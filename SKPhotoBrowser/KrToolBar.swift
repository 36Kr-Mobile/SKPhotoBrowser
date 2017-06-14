//
//  KrToolBar.swift
//  Pods
//
//  Created by 杨洋 on 2017/6/14.
//
//

import UIKit

class KrToolBar: UIView {

    var toolCounterLabel: UILabel!
    var toolDownloadButton: UIButton!
    
    fileprivate weak var browser: SKPhotoBrowser?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, browser: SKPhotoBrowser) {
        self.init(frame: frame)
        self.browser = browser
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        
        toolCounterLabel = UILabel()
        toolCounterLabel.textColor = UIColor.white
        toolCounterLabel.font = UIFont(name: "DINCondensed-Bold", size: 20)
        toolCounterLabel.frame = CGRect(x: 15, y: 24, width: 35, height: 20)
        addSubview(toolCounterLabel)
        
        toolDownloadButton = UIButton()
        toolDownloadButton.setTitleColor(UIColor.white, for: .normal)
        toolDownloadButton.setTitle("保存图片", for: .normal)
        toolDownloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        toolDownloadButton.frame = CGRect(x: frame.size.width - 90, y: 0, width: 90, height: frame.size.height)
        toolDownloadButton.addTarget(browser, action: #selector(SKPhotoBrowser.downloadPhotoAction), for: .touchUpInside)
        addSubview(toolDownloadButton)
        
        isHidden = !SKPhotoBrowserOptions.displayCustomToolbar
    }
    
    func updateToolbar(_ currentPageIndex: Int) {
        guard let browser = browser else { return }
        
        if browser.numberOfPhotos > 1 {
            toolCounterLabel.text = "\(currentPageIndex + 1)/\(browser.numberOfPhotos)"
        } else {
            toolCounterLabel.text = nil
        }
        toolCounterLabel.sizeToFit()
    }
    
}
