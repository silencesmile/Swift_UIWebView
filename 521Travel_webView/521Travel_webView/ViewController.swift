//
//  ViewController.swift
//  521Travel_webView
//
//  Created by youngstar on 16/11/11.
//  Copyright © 2016年 521Travel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var webView:UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let items = ["网页HTML","显示HTML", "显示PDF", "loadData显示PDF"]
        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x:50, y:44, width:self.view.frame.size.width - 100, height:40)
        segmented.selectedSegmentIndex = 1
        segmented .addTarget(self, action: #selector(segmentedAction), for: .valueChanged)
        
        self.view.addSubview(segmented)
        
        webView = UIWebView(frame:CGRect(x:0, y:90, width:375, height:600))
        
        self.view .addSubview(webView)
        webView.scrollView.bounces = false // 加载完成防止滑动
        
        let html = "<h1>欢迎来到：<a href='http://521travel.com'>的墨科技</a></h1>";
        webView.loadHTMLString(html,baseURL:nil)
    }
    
    func segmentedAction(segmented:UISegmentedControl)
    {
        // 获取选项索引
        if segmented.selectedSegmentIndex == 0
        {
            let url = NSURL(string:"http://www.521Travel.com")
            let request = NSURLRequest(url:url! as URL)
            webView.loadRequest(request as URLRequest)
        }
        else if segmented.selectedSegmentIndex == 1
        {
            //            let html = "<h1>欢迎来到：<a href='http://521travel.com'>的墨科技</a></h1>";
            //            webView.loadHTMLString(html,baseURL:nil)
            
            // 显示本地Html
            let path = Bundle.main.path(forResource: "Home_newUser", ofType:"html")
            let urlStr = URL.init(fileURLWithPath: path!)
            print(urlStr)
            webView.loadRequest(URLRequest(url:urlStr))
        }
            
        else if segmented.selectedSegmentIndex == 2
        {
            let path = Bundle.main.path(forResource: "Swift", ofType:"pdf")
            let urlStr = URL.init(fileURLWithPath: path!)
            print(urlStr)
            webView.loadRequest(URLRequest(url:urlStr))
        }
        else if segmented.selectedSegmentIndex == 3
        {
            let path = Bundle.main.path(forResource: "Swift", ofType:"pdf")
            let urlStr = URL.init(fileURLWithPath: path!)
            let data = try! Data(contentsOf: urlStr)
            webView.load(data, mimeType: "application/pdf", textEncodingName: "utf-8",
                         baseURL: NSURL() as URL)
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

