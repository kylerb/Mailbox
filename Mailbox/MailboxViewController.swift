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
    
    @IBOutlet weak var messageBackgroundView: UIView!
    
    
    var messageOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = contentView.frame.size
        
        messageOriginalCenter = messageView.center
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanMessge(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            messageOriginalCenter = messageView.center
            
        } else if sender.state == .changed {
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if messageView.center.x < 100 && messageView.center.x >= -60 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.yellow
                })
                
            }   else if messageView.center.x < -60  {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.orange
                })
                
            }   else if messageView.center.x > 260 && messageView.center.x < 325 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.green
                })
                
            }   else if messageView.center.x > 380  {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.red
                })
                
                
                
                
            } else if sender.state == .ended {
                print("Gesture ended")
            }
            
            
            
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
