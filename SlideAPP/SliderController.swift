//
//  SliderController.swift
//  SlideAPP
//
//  Created by 廖晨如 on 2022/12/3.
//

import UIKit

class SliderController: UIViewController {

    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var slideSegmentedControl: UISegmentedControl!
    @IBOutlet weak var slidePageControl: UIPageControl!
    
    var pageIndex = 0
    var bloodDescriptions = ["  真謹慎的好孩子，凡事都會制定好計畫來執行，且一旦決定就會果斷的前進；自制力相對較強，也善於控制自己的脾氣，待人處事較溫和善於忍耐，但相對來說，缺點就是優柔寡斷，有時會想太多，且比較固執、有完美主義傾向。而Ａ型最好相處的血型即是Ｏ型，第二好相處是ＡＢ型，最對不盤則是Ｂ型。","  相對Ａ型就是一位富有靈感創意的人，且熱衷於冒險，身性外向好奇心強、擁有熱情奔放特質，且不易被情緒控制。但相對缺點就是，容易成為我行我素的人，相對於自由且不拘小節，不太在意表人眼光、也討厭負責。而Ｂ型最好相處的人是ＡＢ型，第二好相處是Ｏ型，最合不來就是Ａ型。","  天生就是一位憑直覺做事的實踐家，擁有相當高行動力，且目標明確，又有樂觀及自信特質，善於團隊合作，但相對缺點就是重現實，難免會給人冷漠感、很容易因為談話直接傷到別人，且有自我中心的傾向，遇到認為不可能做到的事，容易就放棄。而Ｏ型血型最合的是Ｂ型，其次是Ａ型，最易起爭執的則是ＡＢ型。","  擁有強大的交際手腕，但又想保有自己空間，通常聰明且擁有優秀的理解力及適應力，可說是各方面佼佼者，但缺點是雖然表面功夫做得好，但私底下很懶散，且容易被說健忘，也缺乏毅力。而AB型血型最合的是A型，其次是B型，最易起爭執的則是O型。"]
    var images = [UIImage(named: "BloodA.jpg"),UIImage(named: "BloodB.jpg"),UIImage(named: "BloodO.jpg"),UIImage(named: "BloodAB.jpg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //init setting
        updateUI(index: pageIndex)
    }
    private func updateUI(index: Int){
        //Text display
        descriptionTextView.text = bloodDescriptions[index]
        descriptionTextView.textAlignment = .center
        descriptionTextView.isEditable = false
        //Image display
        slideImageView.image = images[index]
        slideImageView.contentMode = .scaleAspectFill
        //SegmentedControl Position
        slideSegmentedControl.selectedSegmentIndex = index
        //PageControl Position
        slidePageControl.currentPage = index
    }
    //上一張
    @IBAction func pre(_ sender: Any) {
        //sender:Any (Button & Gesture)
        //使圖片往前跑(循環不停止)，將index-1除以圖片張數的餘數存入index(算式使index不會少於0)
        pageIndex = (pageIndex - 1 + images.count) % images.count
        updateUI(index: pageIndex)
    }
    //下一張
    @IBAction func next(_ sender: Any) {
        //sender:Any (Button & Gesture)
        //使圖片往後跑(循環不停止)，將index+1除以圖片張數的餘數存入index
        pageIndex = (pageIndex + 1) % images.count
        updateUI(index: pageIndex)
    }
    
    @IBAction func segmentSelect(_ sender: UISegmentedControl) {
        //sender:UISegmentedControl
        pageIndex = sender.selectedSegmentIndex
        updateUI(index: pageIndex)
    }
    
    @IBAction func pageSelect(_ sender: UIPageControl) {
        //sender:UISegmentedControl
        pageIndex = sender.currentPage
        updateUI(index: pageIndex)
    }
    
    @IBAction func random(_ sender: Any) {
        pageIndex = Int.random(in: 0...3)
        updateUI(index: pageIndex)
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
