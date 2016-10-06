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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    required init?(coder aDecoder: NSCoder)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stitch()
    }
    
    func stitch() {
        self.spinner.startAnimating()
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async {
            
            let image1 = UIImage(named:"pano_19_16_mid.jpg")
            let image2 = UIImage(named:"pano_19_20_mid.jpg")
            let image3 = UIImage(named:"pano_19_22_mid.jpg")
            let image4 = UIImage(named:"pano_19_25_mid.jpg")
            
            let imageArray:[UIImage?] = [image1,image2,image3,image4]
            
            let stitchedImage:UIImage = CVWrapper.process(with: imageArray) as UIImage
            
            DispatchQueue.main.async {
                NSLog("stichedImage %@", stitchedImage)
                let imageView:UIImageView = UIImageView.init(image: stitchedImage)
                self.imageView = imageView
                self.scrollView.addSubview(self.imageView!)
                self.scrollView.backgroundColor = UIColor.black
                self.scrollView.contentSize = self.imageView!.bounds.size
                self.scrollView.maximumZoomScale = 4.0
                self.scrollView.minimumZoomScale = 0.5
                self.scrollView.delegate = self
                self.scrollView.contentOffset = CGPoint(x: -(self.scrollView.bounds.size.width - self.imageView!.bounds.size.width)/2.0, y: -(self.scrollView.bounds.size.height - self.imageView!.bounds.size.height)/2.0)
                NSLog("scrollview \(self.scrollView.contentSize)")
                self.spinner.stopAnimating()
            }
        }
    }
    
    
    func viewForZooming(in scrollView:UIScrollView) -> UIView? {
        return self.imageView!
    }
    
}
