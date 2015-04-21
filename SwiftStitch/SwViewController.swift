//
//  SwViewController.swift
//  CVOpenStitch
//
//  Created by Foundry on 04/06/2014.
//  Copyright (c) 2014 Foundry. All rights reserved.
//

import UIKit

class SwViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var spinner:UIActivityIndicatorView!
    @IBOutlet var imageView:UIImageView?
    @IBOutlet var scrollView:UIScrollView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        stitch()
    }
    
    func stitch() {
        self.spinner.startAnimating()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            var image1 = UIImage(named:"pano_19_16_mid.jpg")
            var image2 = UIImage(named:"pano_19_20_mid.jpg")
            var image3 = UIImage(named:"pano_19_22_mid.jpg")
            var image4 = UIImage(named:"pano_19_25_mid.jpg")
            
            var imageArray:[UIImage!] = [image1,image2,image3,image4]
            
            var stitchedImage:UIImage = CVWrapper.processWithArray(imageArray) as UIImage
            
            dispatch_async(dispatch_get_main_queue()) {
                NSLog("stichedImage %@", stitchedImage)
                let imageView:UIImageView = UIImageView.init(image: stitchedImage)
                self.imageView = imageView
                self.scrollView.addSubview(self.imageView!)
                self.scrollView.backgroundColor = UIColor.blackColor()
                self.scrollView.contentSize = self.imageView!.bounds.size
                self.scrollView.maximumZoomScale = 4.0
                self.scrollView.minimumZoomScale = 0.5
                self.scrollView.contentOffset = CGPoint(x: -(self.scrollView.bounds.size.width - self.imageView!.bounds.size.width)/2.0, y: -(self.scrollView.bounds.size.height - self.imageView!.bounds.size.height)/2.0)
                NSLog("scrollview \(self.scrollView.contentSize)")
                self.spinner.stopAnimating()
            }
        }
    }
    
    
    func viewForZoomingInScrollView(scrollView:UIScrollView) -> UIView? {
        return self.imageView!
    }
    
}
