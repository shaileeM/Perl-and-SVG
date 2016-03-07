open(GRADES, "cell-phones.csv") or die "Can't open grades: $!\n";
   LABEL1: while ($line = <GRADES>) 
   {
	
	
	next LABEL1 if /^#/;
	
       ($univ,$os, $grade) = split(",", $line);
              $grades{$os} .= $grade . " ";

   }

   foreach $os (sort keys %grades) {

      $total = 0;
      @grades = split(" ", $grades{$os});
      foreach $grade (@grades) {
          $total += $grade;

      }
      
     print "$os: $grades{$os}\tTotal: $total\n";
        $newar[$ct]=$total;
            $ct=$ct+1;
 }
#print "$newar[0] $newar[1] $newar[2] $newar[3]";


$circle_android =$newar[1]/10;
$circle_windows = $newar[2]/10;
$circle_ios = $newar[3]/10;



 

open($fh,'>' ,"cell-phones_W1188252.html") or die("File Error");
$html = '<!DOCTYPE html>'.
'<head>'.
'<meta charset="utf-8" />'.
'<link rel="stylesheet" href="grid.css">'.
'</head>'.
'<body style="background-color:black;">'.
'<div id="container">'.
'<svg width="900px" height="900px" viewBox="0 0 850 850"
     version="1.1" display="block"  xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink">'. 
  
  
  '<g transform="translate(400, 400)">'. 
    '<circle cx="0" cy="0" r="'.$circle_windows.'" style="fill:rgba(0,0,0,0);stroke:LightCoral ; stroke-width:30; stroke-dasharray:18, 18;">'.
      '<animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0" to="360" begin="0" dur="5s" repeatCount="indefinite" />'.
    '</circle>'.
    '<line x1="-20" y1="0" x2="20" y2="0" style="stroke: blue;" />'.
    '<line x1="0" y1="-20" x2="0" y2="20" style="stroke: blue;" />'. 
  '</g>'.
  '<circle cx="20" cy="200" r="20" stroke-width="3" fill="LightCoral"/>'.
  '<text x="50" y="200" font-family="Verdana" font-size="30" fill="aqua" > Windows</text>'.
  
'<g transform="translate(400, 400)">'. 
    '<circle cx="100" cy="100" r="'.$circle_ios.'" style="fill:rgba(0,0,0,0);stroke:DarkSlateBlue ; stroke-width:30; stroke-dasharray:18, 18;">'.
      '<animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0" to="360" begin="0" dur="5s" repeatCount="indefinite" />'.
    '</circle>'.
    '<line x1="-20" y1="0" x2="20" y2="0" style="stroke: blue;" />'.
    '<line x1="0" y1="-20" x2="0" y2="20" style="stroke: blue;" />'. 
  '</g>'.
  '<circle cx="20" cy="500" r="20" stroke-width="3" fill="DarkSlateBlue"/>'.
  '<text x="50" y="500" font-family="Verdana" font-size="30" fill="aqua" > IOS</text>'.


'<g transform="translate(400, 400)">'. 
    '<circle cx="100" cy="100" r="'.$circle_android.'" style="fill:rgba(0,0,0,0);stroke:MediumAquaMarine; stroke-width:30; stroke-dasharray:18, 18;">'.
      '<animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0" to="360" begin="0" dur="5s" repeatCount="indefinite" />'.
    '</circle>'.
    '<line x1="-20" y1="0" x2="20" y2="0" style="stroke: blue;" />'.
    '<line x1="0" y1="-20" x2="0" y2="20" style="stroke: blue;" />'. 
  '</g>'.
  '<circle cx="650" cy="400" r="20" stroke-width="3" fill="MediumAquaMarine"/>'.
  '<text x="690" y="400" font-family="Verdana" font-size="30" fill="aqua" >Android</text>'.

  '</svg>'.


'</div>'.  
'</body>'.
'</html>';

print $fh $html;
close $fh;
 
