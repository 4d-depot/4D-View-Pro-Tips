// loads the context
var $context:={graph: ds:C1482.GraphExample.all().toCollection()}
$context.currentRow:=[$context.graph[0]]

VP SET DATA CONTEXT("ViewProArea"; $context)

// The table click is manage in the on selection change event of the VP area