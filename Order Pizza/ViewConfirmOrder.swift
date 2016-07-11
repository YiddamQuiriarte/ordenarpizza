//
//  ViewConfirmOrder.swift
//  Ordernar Pizza
//
//  Created by Yiddam on 11/07/16   .
//  Copyright © 2016 Yiddam. All rights reserved.
//

import UIKit

protocol orderPizzaDelegate {
    func newOrder()
}

class ViewConfirmOrder: UIViewController {
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblDough: UILabel!
    @IBOutlet weak var lblCheese: UILabel!
    @IBOutlet weak var txtViewIngredients: UITextView!
    @IBOutlet weak var lblConfirm: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var btnNewOrder: UIButton!
    var delegate: orderPizzaDelegate? = nil
    var orderPizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func showOrder() {
        lblSize.text = orderPizza?.size
        lblDough.text = orderPizza?.kindDough
        lblCheese.text = orderPizza?.kindCheese
        var ingredients: String = ""
        for (_, value) in (orderPizza?.ingredients)! {
            ingredients += "\(value)\n"
        }
        let index1 = ingredients.substringToIndex(ingredients.endIndex.predecessor())
        txtViewIngredients.text = index1
        print(ingredients)
    }
    
    @IBAction func btnAccept(sender: AnyObject) {
        print("Enviar")
        showAlertMessage("Confirmar", message: "Confirma para enviar", owner: self)
    }
    
    @IBAction func btnCancel(sender: AnyObject) {
        print("Editar or cancelar")
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func showAlertMessage (title: String, message: String, owner:UIViewController) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler:{ (ACTION:UIAlertAction!)in
            self.lblConfirm.text = "Su orden ha sido enviada"
            self.btnCancel.hidden = true
            self.btnAccept.hidden = true
            self.btnNewOrder.hidden = false
            //print("User click Accept button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Cancel, handler:{ (ACTION:UIAlertAction!)in
            //print("User click Cancel button")
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func createNewOrder(sender: AnyObject) {
        if delegate != nil {
            delegate!.newOrder()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
