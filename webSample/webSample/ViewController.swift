//
//  ViewController.swift
//  webSample
//
//  Created by MonkeySolution on 12/24/17.
//  Copyright © 2017 MonkeySolution. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation
import AVKit
class ViewController: UIViewController , WKNavigationDelegate {
   
    
    @IBOutlet weak var redBtn: UIButton!
    var webView = WKWebView()
    var player = AVPlayer()
    @IBAction func btnClicked(_ sender: UIButton) {
//        print("btn cki=")
//        UIView.animate(withDuration: 1) {
//            self.webView.alpha = 1
//        }

        //document.getElementById('someElement').innerText
        // webView.evaluateJavaScript("myFunction()") { (any, error) in
         self.player.play()
        webView.evaluateJavaScript("play()") { (result, error) in

    print("error is  :\(error)")
    print(result)
            if error != nil {
                
            }
        }
 //  var contentController = WKUserContentController();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.webView.alpha = 0
        videoConfig()
       webView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
//        var contentController = WKUserContentController();
//        var userScript = WKUserScript(
//            source: "console.log('Hi this is in JavaScript');",
//            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
//            forMainFrameOnly: true
//        )
//        contentController.addUserScript(userScript)
//
//        var config = WKWebViewConfiguration()
//        config.userContentController = contentController
//
//        self.webView = WKWebView(
//            frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height) ,
//            configuration: config
//        )
        
        
      // self.view.insertSubview(webView, belowSubview: redBtn)
        self.view.addSubview(webView)
        self.view.addSubview(self.redBtn)
        webView.navigationDelegate = self
        
    //    let urlStr = "http://gixconnect.com/wp-content/themes/thegem/karaoke/"
        
      //  webView.load(URLRequest.init(url: URL.init(string: urlStr)!))
        
        
       // let config = WKWebViewConfiguration()
        //config.suppressesIncrementalRendering = true
      //  config.allowsInlineMediaPlayback = true
// config.mediaTypesRequiringUserActionForPlayback = .all
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//
//        webView.configuration.preferences = preferences
//         webView.configuration.suppressesIncrementalRendering = true
//         webView.configuration.allowsInlineMediaPlayback = true
//         webView.configuration.mediaTypesRequiringUserActionForPlayback = .all
        // ****
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let folderPath = Bundle.main.bundlePath
        let baseUrl = URL(fileURLWithPath: folderPath, isDirectory: true)
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let htmlString = try NSString(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8.rawValue)
            webView.loadHTMLString(htmlString as String, baseURL: baseUrl)
        } catch {
            // catch error
        }
    
        
        self.webView.isOpaque = false
        self.webView.backgroundColor = UIColor.clear
        self.webView.scrollView.backgroundColor = UIColor.clear
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func videoConfig(){
        
        self.player = AVPlayer.init(url: Bundle.main.url(forResource: "movie", withExtension: "mp4")!)
        player.isMuted = true
        let playerLayer = AVPlayerLayer.init(player: player)
        playerLayer.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
   
        let myView = UIView.init(frame: self.view.frame)
        self.view.insertSubview(myView, belowSubview: self.webView)
        myView.backgroundColor = UIColor.black
           myView.layer.addSublayer(playerLayer)
    }
    

}

