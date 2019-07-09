//
//  HomeViewController.swift
//  FundSwift
//
//  Created by D on 2019/6/10.
//  Copyright © 2019 D. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController {
    
    var model: DModel?
    //请求参数
    
    let pi = 1
    let pz = 1
    
    lazy var segment: UISegmentedControl = {
        let tempView = UISegmentedControl(items: ["moya", "chain", "AFN式"])
        tempView.frame = CGRect(x:0, y: 300, width: self.view.frame.width, height: 40)
        tempView.selectedSegmentIndex = 0
        tempView.addTarget(self, action: #selector(clickSegment), for: .valueChanged)
        return tempView
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: CGRect(x:0, y: 340, width: self.view.frame.width, height: self.view.frame.height - 340), style: .plain)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        
        table.delegate = self
        table.dataSource = self
        table.register(DCell.self, forCellReuseIdentifier: "DCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let array = NSMutableArray.init(array: ["1","2"])
        let banner = Banner.init(frame: CGRect.init(x: 0, y: 0, width: Screen_Width, height: 300))
        banner.backgroundColor = UIColor.cyan
        
        self.view.addSubview(banner)
        
        self.view.addSubview(segment)
        self.view.addSubview(tableView)
        loadDataByMoay()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.returnData?.rankinglist?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DCell = tableView.dequeueReusableCell(withIdentifier: "DCell", for: indexPath) as! DCell
        cell.model = model?.data.returnData?.rankinglist?[indexPath.row]
        return cell
    }
}

extension HomeViewController {
    
    @objc func clickSegment() {
        switch segment.selectedSegmentIndex {
        case 0:
            loadDataByMoay()
        case 1:
            loadDataByChain()
        case 2:
            loadDataByAFN()
        default:
            break
        }
    }
    
    /// moya请求
    func loadDataByMoay() {
        MoyaRequest.loadData(API: DMAPI.self, target: .rankList, cache: true, success: { (json) in
            let decoder = JSONDecoder()
            let model = try? decoder.decode(DModel.self, from: json)
            self.model = model
            self.tableView.reloadData()
        }, failure: nil)
        
    }
    
    /// 链式请求
    func loadDataByChain() {
        NetworkKit().url("http://app.u17.com/v3/appV3_3/ios/phone/rank/list").requestType(.post).success { (json) in
            let decoder = JSONDecoder()
            let model = try? decoder.decode(DModel.self, from: json)
            self.model = model
            self.tableView.reloadData()
            
            }.failure { (state_code, message) in
                
            }.request()
    }
    
    /// 类AFN请求
    func loadDataByAFN() {
        NetworkTools.POST(url: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list", params: nil, success: { (json) in
            let decoder = JSONDecoder()
            let model = try? decoder.decode(DModel.self, from: json)
            self.model = model
            self.tableView.reloadData()
        }) { (state_code, message) in
            
        }
    }
}

