<?php
  if (PHP_OS === 'WINNT')
  {
    pclose(popen("start ..\script\close.bat", "r"));
  }else{
    pclose(popen("../script/close.sh", "r"));
  }
?>
<html>
<head>
<script language="javascript" type="text/javascript">
function closeWindow() {
window.open('','_parent','');
window.close();
}
</script>
</head>
<body>
<a href onclick="closeWindow();">Close Window</a>
</body>
</html>