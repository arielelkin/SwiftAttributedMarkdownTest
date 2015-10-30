//
//  ViewController.swift
//  Acknowledgements
//
//  Created by Ariel Elkin on 30/10/15.
//  Copyright (c) 2015 Ariel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()


        let url = NSBundle.mainBundle().URLForResource("Acknowledgements", withExtension: "markdown")!
        let data = NSData(contentsOfURL: url)!

        let markdownString = NSString(data: data, encoding: NSUTF8StringEncoding)! as! String

        let emFont = UIFont(name: "Palatino", size: 20)!
        let headerFont = UIFont(name: "Palatino", size: 40)!


        var attributes = [NSObject: AnyObject]()
        attributes[Int(EMPH.value)] = [NSFontAttributeName: emFont]
        attributes[Int(H2.value)] = [NSFontAttributeName: headerFont]


        let prettyText = markdown_to_attr_string(markdownString, 0, attributes)


        textView.attributedText = prettyText

        textView.editable = false
        textView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(textView)

        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[textView]-|", options: nil, metrics: nil, views: ["textView": textView])
        NSLayoutConstraint.activateConstraints(constraints)

        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[textView]-40-|", options: nil, metrics: nil, views: ["textView": textView])
        NSLayoutConstraint.activateConstraints(constraints)
    }



}

