//
//  ViewController.swift
//  Explorer
//
//  Created by etudiant on 10/05/2017.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource
{

    let favouriteThing = ["Cordova","Linux"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favouriteThing.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyList")
        cell?.textLabel?.text = self.favouriteThing[indexPath.row]
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

