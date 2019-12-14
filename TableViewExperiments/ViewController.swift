//
//  ViewController.swift
//  TableViewExperiments
//
//  Created by リヴォーフ　ユーリ on 2019/12/14.
//  Copyright © 2019 リヴォーフ　ユーリ. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var getCell: Int! = 0
    
    var chosenCell: Int! = 0
    
    let tomatoArray: [String] = ["t農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let suikaArray: [String] = ["su農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let ninzinArray: [String] = ["n農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let rakkaseiArray: [String] = ["r農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let zyagaArray: [String] = ["z農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let aopapaiyaArray: [String] = ["a農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    let soramameArray: [String] = ["so農薬名1","農薬名2","農薬名3","農薬名4","農薬名5","農薬名6","農薬名7"]
    
    var activeArray: [String] = []
    
    var tableViewCells: [String] = ["TableViewCellFirst", "TableViewCellSecond"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCell = Int.random(in: 0...6)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        switch getCell {
        case 0:
            activeArray = tomatoArray
        case 1:
            activeArray = suikaArray
        case 2:
            activeArray = ninzinArray
        case 3:
            activeArray = rakkaseiArray
        case 4:
            activeArray = zyagaArray
        case 5:
            activeArray = aopapaiyaArray
        case 6:
            activeArray = soramameArray
        default:
            break
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeArray.count
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let getCellType = Int.random(in: 1...2)

        switch getCellType {
        case 1:
            var cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TableViewCellFirst
            cell = doSomethingWithTableViewCellFirst(cell: cell, index: indexPath.row)
            return cell
        default:
            var cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! TableViewCellSecond
            cell = doSomethingWithTableViewCellSecond(cell: cell, index: indexPath.row)
            return cell
        }
    }
    
    func doSomethingWithTableViewCellFirst(cell: TableViewCellFirst, index: Int) -> TableViewCellFirst {
        cell.textLabel!.text = activeArray[index]
        cell.mylabel!.text = "これは「TableViewCellFirst」です"
        return cell
    }

    func doSomethingWithTableViewCellSecond(cell: TableViewCellSecond, index: Int) -> TableViewCellSecond {
        cell.textLabel!.text = activeArray[index]
        cell.mylabel!.text = "これは「TableViewCellSecond」です"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenCell = indexPath.row
        performSegue(withIdentifier: "showVedgi" , sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let secondViewController = segue.destination as! SecondViewController
        
        secondViewController.getCell = chosenCell
        secondViewController.vedgiName = activeArray[chosenCell]
    }
}
