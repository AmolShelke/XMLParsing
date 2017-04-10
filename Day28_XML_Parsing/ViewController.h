//
//  ViewController.h
//  Day28_XML_Parsing
//
//  Created by Student P_05 on 10/04/17.
//  Copyright © 2017 Amol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>
@property NSMutableString *charString;
@property NSMutableArray *plantArray;
@property NSXMLParser *saxParser;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

