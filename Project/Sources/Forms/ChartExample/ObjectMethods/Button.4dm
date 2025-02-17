// loads the context
var $context:={graph: ds:C1482.GraphExample.all().toCollection()}
$context.currentRow:=[$context.graph[0]]

VP SET DATA CONTEXT("ViewProArea"; $context)

// The table click is managed in the "on selection change event" of the VP area


/***********************************************
Code for creating the tables by programming
The graph is created by the interface 
and refers to the SelectedQuarterTableRow table
***********************************************/

// table parameters
//$parameter:={tableColumns: []}
//$parameter.tableColumns.push({name: "Label"; dataField: "Label"})
//$parameter.tableColumns.push({name: "Quarter 1"; dataField: "Quarter1"})
//$parameter.tableColumns.push({name: "Quarter 2"; dataField: "Quarter2"})
//$parameter.tableColumns.push({name: "Quarter 3"; dataField: "Quarter3"})
//$parameter.tableColumns.push({name: "Quarter 4"; dataField: "Quarter4"})
//// table creation
//VP CREATE TABLE(VP Cells("ViewProArea"; 0; 0; $parameter.tableColumns.length; 1); "QuarterTable"; "graph"; $parameter)
//VP SET VALUE(VP Cell("ViewProArea"; 10; 0); {value: "Selected Row"})
//VP CREATE TABLE(VP Cells("ViewProArea"; 10; 1; $parameter.tableColumns.length; 1); "SelectedQuarterTableRow"; "currentRow"; $parameter)

//// Manage the row selection in the table
//var $range:=VP Get table range("ViewProArea"; "QuarterTable")
//$rules:=cs.VPRules.new("ViewProArea")
//$rules.addRowStateRule($range; "selected"; "'lightgreen'")
//$rules.addRowStateRule($range; "hover"; "'rgb(205, 228, 153)'")
