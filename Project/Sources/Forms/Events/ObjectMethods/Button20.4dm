
var $p : cs:C1710.VPFloatingPictures

$p:=cs:C1710.VPFloatingPictures.new("ViewProArea")

$p.Add("4DLogo"; Folder:C1567(fk resources folder:K87:11).file("4d.png").platformPath; 20; 20; 50; 50)
$p.Move("4DLogo"; VP Get selection("ViewProArea"))

//$names:=$p.Names()

$p.BackColor("4DLogo"; "white")
$p.BorderStyle("4DLogo"; "double")
$p.BorderWidth("4DLogo"; 2)
$p.BorderColor("4DLogo"; "black")

//$p.Height("4DLogo"; 100)
//$p.Width("4DLogo"; 100)
//$p.X("4DLogo"; 30)
//$p.Y("4DLogo"; 30)

$p.Stretch("4DLogo"; 0)

//$p.Remove("4DLogo")
