//
//  TryTicketViewController.swift
//  swiftTry
//
//  Created by nhl on 2017/12/12.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class TryTicketViewController: UIViewController {

    @IBOutlet weak var tryTableView: UITableView!//

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension TryTicketViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TryTicketTableViewCell")
        as? TryTicketTableViewCell
        return cell!
    }
    func setupTableView() {
        tryTableView.delegate=self
        tryTableView.dataSource=self
        
    }
    
}
