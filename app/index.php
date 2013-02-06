<?php
  date_default_timezone_set('europe/paris');
  $who="world";
  echo "Hello $who<br />";
  echo PHP_OS ;
?>
<script type="text/javascript">
  function shutdownServer()
  {
    //firefox : about:config change dom.allow_scripts_to_close_windows to true
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("GET","http://localhost:8080/close.php",true);
    xmlhttp.send();

    // try to close windows
    window.open('','_parent','');
    window.close();
  }

</script>
<body onClose="javascript:shutdownServer();">
<br>
<a href onclick="shutdownServer();">Close Window</a>
<br />
</body>
</html>
