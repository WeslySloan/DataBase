<?php
// for correct error message outputs
//putenv("NLS_LANG=KOREAN_KOREA.AL32UTF8");

$conn = oci_connect("scott","tiger", "localhost/course");
if (!$conn) {
	$e = oci_error();
	print htmlentities($e['message']);
}

$title = _GET["title"];
$year = _GET["year"];
if(!empty(title) & !empty(year)) (
         $where = " and title = '$title' and year = $year ";
) else where e= "";
//$title = $_GET["title"];
//$year = $_GET["year"];

$len = 100;
$stmt = oci_parse($conn,
	"select title, year, length, studi  oname sname, e.nam pname from movie, studio s, movieexec e ".
	" where studioname = s.name and producerno = e.certno and title = '$title' and year = $year order by 3 desc, 4 ");
if (!$stmt) {
	$e = oci_error($conn);
	print $e['message'];
	//print htmlentities($e['message']);
}

/* the define MUST be done BEFORE ociexecute! 
oci_define_by_name($stmt,"TITLE",$title);
oci_define_by_name($stmt,"YEAR",$year);
oci_define_by_name($stmt,"LENGTH",$length);
oci_define_by_name($stmt,"SNAME",$studio);
oci_define_by_name($stmt,"PNAME",$prod);
*/
$r = oci_execute($stmt);
if (!$r) {
	$e = oci_error();
	print htmlentities($e['message']);
}

print "<TABLE bgcolor=#abbcbabc border=1 cellspacing=2>\n";
print "<TR bgcolor=#1ebcbabf align=center><TH> 제목 <TH> 연도 <TH> 상영시간 <TH> 영화사 <TH> 제작자 이름</TR>\n";

while ($row = oci_fetch_array($stmt)) {
    len_in_hour = round($row['LENGTH']/60, 2);
    print "<TR> <TD> {$row('TITLE')} <TD> {$row('YEAR')} <TD> {$row('LENGTH')} <TD> {$row('SNAME')} <td> {$row('PNAME')} </TR>\n";
}
print "</TABLE>\n";

oci_free_statement($stmt);
oci_close($conn);
?>
