//
//  ViewController.swift
//  PhotoAnimation
//
//  Created by Konstantyn Koroban on 23/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageNames = ["FirstImage", "SecondtImage", "ThirstImage", "Fourthimage"]
    private var currentImageIndex = 0
    private var currentImageView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        sheduledSliderTimer()
    }
    
    private func configureView(){
        view.backgroundColor = .black
    }
    
    private func sheduledSliderTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(handleSliderTimer), userInfo: nil, repeats: true)
        timer.tolerance = 0.2
        timer.fire()
    }
    
    private func showNewxImage() {
        guard !imageNames.isEmpty else { return }
        if currentImageIndex >= imageNames.count { currentImageIndex = 0 }
        let nextImageName = imageNames[currentImageIndex]
        let imageView = makePhotoView(with: nextImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        view.addSubview(imageView)
        currentImageIndex += 1
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: { imageView.frame.origin = .zero}, completion: { _ in self.currentImageView?.removeFromSuperview()
            self.currentImageView = imageView })
    }
    
    private func makePhotoView(with imageName: String) -> UIView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = view.frame
        imageView.frame = CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
        return imageView
    }
    
    @objc private func handleSliderTimer(_ sender: Timer) {
        showNewxImage()
    }
    
}

