//
//  ViewController.m
//  Day28_XML_Parsing
//
//  Created by Student P_05 on 10/04/17.
//  Copyright © 2017 Amol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=@"http://www.w3schools.com/xml/plant_catalog.xml";
    self.plantArray=[[NSMutableArray alloc]init];
    NSURL *url=[NSURL URLWithString:str];
    self.saxParser=[[NSXMLParser alloc]initWithContentsOfURL:url];
    self.saxParser.delegate=self;
    [self.saxParser parse];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.charString=[[NSMutableString alloc]init];
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.charString appendString:string];
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [self.plantArray addObject:self.charString];
    //[self.myTableView reloadData];
    NSLog(@"%@",self.plantArray);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.plantArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.plantArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
