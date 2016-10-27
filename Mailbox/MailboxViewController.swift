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
    
    @IBOutlet weak var laterIcon: UIImageView!
    
    @IBOutlet weak var listIcon: UIImageView!
    
    @IBOutlet weak var archiveIcon: UIImageView!
    
    @IBOutlet weak var deleteIcon: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = contentView.frame.size
        
        messageOriginalCenter = messageView.center
        
        self.messageBackgroundView.backgroundColor = UIColor.lightGray
        
        laterIcon.alpha = 0
        listIcon.alpha = 0
        archiveIcon.alpha = 0
        deleteIcon.alpha = 0
        
        
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
                    self.laterIcon.alpha = 1
                    self.listIcon.alpha = 0
                })
                
            }   else if messageView.center.x < -60  {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.orange
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 1
                })
                
            }   else if messageView.center.x > 260 && messageView.center.x < 325 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.green
                    self.archiveIcon.alpha = 1
                    self.deleteIcon.alpha = 0
                })
                
            }   else if messageView.center.x > 380  {
                
                UIView.animate(withDuration: 0.1, animations: {
                    self.messageBackgroundView.backgroundColor = UIColor.red
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 1
                })
                
            }   else if messageView.center.x < 260 && messageView.center.x > 60 {
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.messageBackgroundView .backgroundColor = UIColor.lightGray
                })
                
                self.laterIcon.alpha = 0
                self.listIcon.alpha = 0
                self.archiveIcon.alpha = 0
                self.deleteIcon.alpha = 0
                
                
            }
            
            
            
            
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if messageView.center.x < 100 && messageView.center.x >= -60 {
                
                UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.messageView.center.x = -185
                    }, completion: { (Bool) in
                        // reveal later view
                })
            }   else if messageView.center.x < -60 {
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.messageView.center.x = -185
                    }, completion: { (Bool) in
                        // reveal list view
                })
            }   else if messageView.center.x > 260 {
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.messageView.center.x = 500
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: { (Bool) in
                        UIView.animate(withDuration: 1.5, animations: {
                            self.messageBackgroundView.backgroundColor = UIColor.white
                        })
                })
                
                UIView.animate(withDuration: 1.0, delay: 2.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.messageView.center.x = 160
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: nil)
                
                
            }   else if messageView.center.x < 260 && messageView.center.x > 60 {
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.messageView.center.x = 160
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: nil)
            }
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


