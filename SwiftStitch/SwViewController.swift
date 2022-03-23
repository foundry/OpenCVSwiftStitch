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
        self.scrollView.delegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.spinner.startAnimating()
        stitch { [weak self] image in
            self?.displayImage(image: image)
            self?.spinner.stopAnimating()
        }
    }
    
    func stitch(completion:@escaping ( UIImage)->())  {
        DispatchQueue.global().async {
            guard
                let image1 = UIImage(named:"pano_19_16_mid.jpg"),
                let image2 = UIImage(named:"pano_19_20_mid.jpg"),
                let image3 = UIImage(named:"pano_19_22_mid.jpg"),
                let image4 = UIImage(named:"pano_19_25_mid.jpg")
            else { return }
           
            let images:[UIImage] = [image1,image2,image3,image4]
            let stitchedImage:UIImage = CVWrapper.process(with: images)
            DispatchQueue.main.async {
                completion(stitchedImage)
            }
        }
    }
    
    func displayImage(image: UIImage) {
        let imageView:UIImageView = UIImageView.init(image: image)
        self.imageView = imageView
        self.scrollView.addSubview(self.imageView!)
        self.scrollView.contentSize = self.imageView!.bounds.size
        self.scrollView.contentOffset = CGPoint(x: -(self.scrollView.bounds.size.width - self.imageView!.bounds.size.width)/2.0, y: -(self.scrollView.bounds.size.height - self.imageView!.bounds.size.height)/2.0)
        NSLog("scrollview \(self.scrollView.contentSize)")
    }
    
   
    
    
    func viewForZooming(in scrollView:UIScrollView) -> UIView? {
        return self.imageView!
    }
    
}
