//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Kyler Blue on 10/23/16.
//  Copyright © 2016 Kyler Blue. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var messageView: UIView!
    
    var messageOriginalCenter: CGPoint!


    override func viewDidLoad() {
        super.viewDidLoad()
        
    scrollView.delegate = self
    scrollView.contentSize = contentView.frame.size

    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPanMessge(_ sender: UIPanGestureRecognizer) {
        
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            messageOriginalCenter = messageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
        } else if sender.state == .ended {
            print("Gesture ended")
        }
        
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
