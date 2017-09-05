//
//  ViewController.swift
//  samplePickerView
//
//  Created by takahiro tshuchida on 2017/08/31.
//  Copyright © 2017年 Takahiro Tshuchida. All rights reserved.
//

import UIKit
import AVFoundation

//❶プロトコル(手段、特定の部品を操る能力)を追加
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    
//    データを配列で用意する(メンバー変数)
    var world = ["インド","モロッコ","ラオス","メキシコ"]
    
    
    var audioPlayerInstance : AVAudioPlayer! = nil  // 再生するサウンドのインスタンス
    var audioPlayerInstance2 : AVAudioPlayer! = nil
    var audioPlayerInstance3 : AVAudioPlayer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        指示を出しているのはViewControlerだと知らせる設定
//        self :自分自身(ViewControllerのこと)
        
//        データソース(データを設定するところ)
        myPicker.dataSource = self
//        デリゲート(委任する、代理人(店長))
        myPicker.delegate = self
        
    }
    
//    -> Int　意味はInt型でデータを返す(戻り値のデータ型はIntだよ)
    
//    ❷ピッカービューの配列を決定する
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
//        一列に指定
    }
    
    
//    ❸ピッカービューの行数を決定する
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        配列の要素の個数と同じ数を設定
        return world.count
    }
    
    
//    ❹ピッカービューに表示する 文字の設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        teaList[0] -> ダージリンが表示される
//        return "選択肢\(row)"
        return world[row]
//        string型
    }
    
//    6 選択された項目をデバックエリアに表示
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        選択されてる行番号:row
//        print(world[row])
       
        
        //  ❶部品となるアラートを作成
        let alert = UIAlertController(title: "次の旅路は？", message: world[row], preferredStyle: .alert)
        
        //  ❷OKボタンを追加
        //   handler:OKボタンが押された時に行いたい処理を指定
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in

            if self.world[row] == "モロッコ"{
            
            let clickSound  = Bundle.main.path(forResource: "moro", ofType: "mp3")!
            let sound2:URL  = URL(fileURLWithPath: clickSound)
            
            do {
                self.audioPlayerInstance = try AVAudioPlayer(contentsOf: sound2, fileTypeHint:nil)
            } catch {
                print("AVAudioPlayerインスタンス作成失敗")
            }
            self.audioPlayerInstance.play()
            
            }else if self.world[row] == "ラオス"{
            
                let clickSound  = Bundle.main.path(forResource: "raos", ofType: "mp3")!
                let sound2:URL  = URL(fileURLWithPath: clickSound)
                
                do {
                    self.audioPlayerInstance2 = try AVAudioPlayer(contentsOf: sound2, fileTypeHint:nil)
                } catch {
                    print("AVAudioPlayerインスタンス作成失敗")
                }
             
                self.audioPlayerInstance2.play()
            
            }else if self.world[row] == "メキシコ"{
            
                let clickSound  = Bundle.main.path(forResource: "mekisico", ofType: "mp3")!
                let sound2:URL  = URL(fileURLWithPath: clickSound)
                
                do {
                    self.audioPlayerInstance3 = try AVAudioPlayer(contentsOf: sound2, fileTypeHint:nil)
                } catch {
                    print("AVAudioPlayerインスタンス作成失敗")
                }

                self.audioPlayerInstance3.play()
            
            }else{
            print("インド")
            
            }
        
        
        
        }))
        
        //  ❸アラートを表示する
        present(alert,animated: true,completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

