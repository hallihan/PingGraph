cat <<EOF
<!DOCTYPE html>
<html>
<meta http-equiv="refresh" content="120;" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<title>How Bad is the Internet?</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div style="width:630px; margin:0 auto;">
<H2 style="text-align:center;">How Bad is the Internet Today?</H2>
<div class="w3-sidebar w3-bar-block w3-light-grey w3-card" style="width:130px">
  <h5 class="w3-bar-item">Menu</h5>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, '1H')">1 Hour</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, '4H')">4 Hours</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, '12H')">12 Hours</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, '24H')">24 Hours</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, '72H')">72 Hours</button>
  <button class="w3-bar-item w3-button tablink" onclick="openTab(event, 'Details')">Details</button>
  <button class="w3-bar-item w3-button tablink" onclick="openInNewTab('./archive/');">Archive</button>
</div>

<div style="margin-left:130px">
  <div id="1H" class="w3-container tabn w3-animate-zoom" style="display:none">
    <h2>1 Hour</h2>
    <img src='ping_plot1.png'/>
  </div>
  <div id="4H" class="w3-container tabn w3-animate-zoom">
    <h2>4 Hours</h2>
    <img src='ping_plot4.png'/>
  </div>
  <div id="12H" class="w3-container tabn w3-animate-zoom" style="display:none">
    <h2>12 Hours</h2>
    <img src='ping_plot12.png'/>
  </div>
  <div id="24H" class="w3-container tabn w3-animate-zoom" style="display:none">
    <h2>24 Hours</h2>
    <img src='ping_plot24.png'/>
  </div>
  <div id="72H" class="w3-container tabn w3-animate-zoom" style="display:none">
    <h2>72 Hours</h2>
    <img src='ping_plot72.png'/>
  </div>
  <div id="Details" class="w3-container tabn w3-animate-zoom" style="display:none">
  <table border=1>
      <tr><th>Time</th><th>Sent</th><th>Received</th><th>Lost</th></tr>
EOF

    while read INPUT ; do
            echo "<tr><td>${INPUT//,/</td><td>}</td></tr>" ;
    done < $DATADIR/pingdata.csv ;

cat <<EOF
</table></div>
</div>
</div>

<script>
function openTab(evt, tabName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("tabn");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
function openInNewTab(url) {
  var win = window.open(url, '_blank');
  win.focus();
}
</script>

</body>
</html>
EOF

