//
//  ViewController.swift
//  CollectionViewTest2
//
//  Created by Pavel Ivanov on 3/14/19.
//  Copyright © 2019 Pavel Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,20,10]
    
    let rows = 3
    let columnVisible = 3
    var columnTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
       // items = [0,1,2,3,4,5,6,7,8,9]
        
        if items.count <= columnVisible {
            
           columnTotal = items.count
            
        } else if items.count > rows * columnVisible {
            
            columnTotal = (items.count - 1) / rows + 1
            
        } else {
            
           columnTotal = columnVisible
            
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return columnTotal * rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.contentView.backgroundColor = .green
        
        if let label = cell.contentView.viewWithTag(10) as? UILabel {
            
            let i = indexPath.item / rows
            let j = indexPath.item % rows
            
            let item = j * columnTotal + i
            
            guard item < items.count else {
                
                cell.isHidden = true
                
                return cell
            }
            
            label.text = "\(items[item])"
            //label.text = "\(indexPath.row)"
            
           // let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            
            //let itemInWidth = Int(self.collectionView.frame.size.width / flow.itemSize.width) //ко-во елементов в строке
           // let itemInHeight = Int((self.collectionView.frame.size.height / flow.itemSize.height)+1)
            
            //let t = indexPath.row % 2 // строка четная/нечетная
            
           // let itemsCount = items.count
            
          /*  if x < itemInHeight && y < itemInWidth {
                
                    label.text = String( items[ x * 3 + y ] - 1 )
             
                    x += 1
             
                    if x == itemInHeight {
             
                       // label.text = String( items[ x * 2 + 1 ] - 1 )
             
                        x = 0
             
                        y += 1
                    }
                
            } else {
                
                 label.text = String( items[ x * 3 ] + 2 )
             
                 x += 1
             
                if x == 3 {
             
                    // label.text = String( items[ x * 2 + 1 ] - 1 )
                    
                    x = 0
             
                    y += 1
                }
            }*/
            
            /*var index:Int
            
                if t == 0  {
                     index = ( itemInWidth / 2 ) - indexPath.row
                } else {
                    index = ( itemInWidth / 2 ) * indexPath.row - 1
                }
            if items.count > index{
                label.text = String(items[index])
            }*/
            
            
            /*for x in 0..<5 {
                for y in 0..<2 {
                    array1[x][y] = x * 2 + y
                    }
              }
             */
            
            /*for x in 0..<5 {
                array1[x][0] = arr[x]
                array1[x][1] = arr[x+5]
            }*/
            
           /* if x < 2 {
               
                if y < 4 {
                    label.text = String(items[x * 2 + y])
                    y += 1
                } else {
                    y = 0
                }
                 x += 1
            } else {
                x = 0
            }*/
            
            /*for x in 0..<5 {
                for y in 0..<2 {
                     label.text = String(items[x * 2 + y])
                }
            }*/
            
            
            
            print("section: \(indexPath.section) row: \(indexPath.row)   \(indexPath.description)")
            
            /*for x in 0..<4 {
                for y in 0..<4 {
                    
                    var index = x+y
                    
                    label.text = String(indexPath.row)
                }
            }
 */
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       // let flow = collectionViewLayout as! UICollectionViewFlowLayout
        
        //let separator = Int(flow.minimumInteritemSpacing)
        
        //let itemInWidth = Int(self.collectionView.frame.size.width / flow.itemSize.width)
        
       // let colWidth = Int(self.collectionView.frame.size.width)
        
       // let itemWidthWithoutSeparator = (colWidth - (itemInWidth-1)*separator) / itemInWidth
        
        
        let height = self.collectionView.frame.size.height / 3.0 // высота
        
        let width = self.collectionView.frame.size.width / 3.0 //ширина
        
      /*  if (indexPath.row % 3 == 0){
            
            height = self.collectionView.frame.size.height / 4.0
        } else if (indexPath.row % 3 == 1){
            
            height = self.collectionView.frame.size.height / 5.0
        }
        
        if (indexPath.row == 6){
            
            height = 300.0
        }*/
        
        //return CGSize(width: CGFloat(max(itemWidthWithoutSeparator,1)), height:height)
        return CGSize(width: width, height:height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        //CGSize(width: collectionView.frame.size.width, height: 100)
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionFooter){
            
             let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
        
        return header
    }
}

