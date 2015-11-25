//
//  Datasource.swift
//  iOS9Features
//
//  Created by Shane on 15/11/25.
//  Copyright © 2015年 Shane. All rights reserved.
//

import UIKit
import CoreSpotlight

class Datasource: NSObject {

    var people: [Person];
    
    override init() {
        let becky = Person();
        becky.name = "Becky";
        becky.id = "1";
        becky.image = UIImage(named: "becky")!
        
        let ben = Person();
        ben.name = "Ben"
        ben.id = "2"
        ben.image = UIImage(named: "ben")!
        
        let jane = Person()
        jane.name = "Jane"
        jane.id = "3"
        jane.image = UIImage(named: "jane")!
        
        let pete = Person()
        pete.name = "Pete"
        pete.id = "4"
        pete.image = UIImage(named: "pete")!
        
        let ray = Person()
        ray.name = "Ray"
        ray.id = "5"
        ray.image = UIImage(named: "ray")!
        
        let tom = Person()
        tom.name = "Tom"
        tom.id = "6"
        tom.image = UIImage(named: "tom")!
        
        people = [becky, ben, jane, pete, ray, tom]
    }
    
    func friendFromID(id: String) -> Person? {
        for person in people{
            if(person.id == id){
                return person;
            }
        }
        return nil;
    }
    
    func savePeopleToIndex(){
        var seachableItems = [CSSearchableItem]()
        
        for person in people {
            let attributeSet = CSSearchableItemAttributeSet(itemContentType: "image" as String);
            attributeSet.title = person.name;
            attributeSet.contentDescription = "This is an entry all about the interesting person called \(person.name)";
            attributeSet.thumbnailData = UIImagePNGRepresentation(person.image);
            
            let item = CSSearchableItem(uniqueIdentifier: person.id, domainIdentifier: "com.ios9.searchapis.people", attributeSet: attributeSet);
            seachableItems.append(item);
                
            }
        
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems(seachableItems) { (error) -> Void in if error != nil{
            print(error?.localizedDescription);
            }
            
        }
        }
    
    
    }
}
