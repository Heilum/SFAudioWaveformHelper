#SFAudioWaveformHelper


This project illustrates how to use Accelerate framework and generate the waveform image of an audio file

![ScreenShot](https://raw.github.com/JagieChen/SFAudioWaveformHelper/master/s1.png)

The code is derived from https://github.com/fulldecent/FDWaveformView and enlightened from http://www.davidstarke.com/2015/04/waveforms.html



## Features

* Using Swift 3;
* Using Accelerate framework;
* Just a simple function calling, you get the waveform image. 

## How to use
<pre><code>
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
</code></pre>

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).


