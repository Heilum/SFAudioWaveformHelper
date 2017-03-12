//
//  ViewController.swift
//  SFAudioWaveformHelper
//
//  Created by CHENWANFEI on 12/03/2017.
//  Copyright © 2017 SwordFish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onGenerate(_ sender: Any) {
        let now = Date.timeIntervalSinceReferenceDate;
        let audioURL = Bundle.main.url(forResource: "audio", withExtension: "mp3")!;
        let scale = UIScreen.main.scale;
        let imageSizeInPixel =  CGSize(width:imageView.bounds.width * scale,height:imageView.bounds.height * scale);
        generateWaveformImage(audioURL: audioURL, imageSizeInPixel: imageSizeInPixel, waveColor: UIColor.red) {[weak self] (waveFormImage) in
            if let waveFormImage = waveFormImage {
                self?.imageView.image = waveFormImage;
                print("image.size = \(waveFormImage.size),scale=\(waveFormImage.scale)")
                self?.alert(str: "Seconds costed:\(Date.timeIntervalSinceReferenceDate - now)");
            }else{
                self?.alert(str: "Shit happens");
            }
        }
    }
    
    
    private func alert(str:String){
        let ac = UIAlertController(title: "Result", message: str, preferredStyle: UIAlertControllerStyle.alert);
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (_) in
            ac.dismiss(animated: true, completion: nil);
        }))
        self.present(ac, animated: true, completion: nil);
    }

}

