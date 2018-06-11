<!--news box starts here-->
</div>
      <!--right column ends here-->
      <br class="clear" />
    </div>
    <!--main ends here-->
  </div>
</div>
<div class="content_bottom"></div>
<!--content ends here-->


<!--footer starts here-->
<div id="footer">
  <p class="float_left"><b>Abacsiszauna.hu</b> 2010 Minden jog fenntartva!</p>
  
  <div class="links">
    <a href="{$impr}" title="Impresszum">Impresszum</a>&nbsp;|
    <a href="{$linkekFilename}" title="Linkek">Linkek</a>&nbsp;|
    <a href="{$contactFilename}" title="Kapcsolat">Kapcsolat</a>
  </div>
  
  <p class="float_right">
    <a title="Honlapkészítés" href="http://www.inteliart.hu/" target="_blank">Honlapkészítés</a> és <a title="Internet Marketing" href="http://www.inteliart.hu/internet-marketing.html" target="_blank">e-marketing</a>:  <a title="Honlapkészítés" href="http://www.inteliart.hu/inteliart-media.html" target="_blank">InteliArt</a>
  </p>  
  <br class="clear" />
</div>
<!--footer ends here-->   


{if $hiba!=''}
  <script type="text/javascript">
    alert ('{$hiba}');
  </script>
{/if}     

{if $X_uzenet!=''}
  <script type="text/javascript">
    alert ('{$X_uzenet}');
  </script>
{/if}     


{literal}
<script type="text/javascript"> 
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2134424-46']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })(); 
</script> 
{/literal}

</body>
</html>
