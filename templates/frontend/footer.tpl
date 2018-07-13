<!--news box starts here-->
        <div class="news_box">
          <h2 class="title"><a href="#" title="">Friss hírek</a></h2>
          
          <div class="container">

 {foreach name=articles from=$articles item=article}
            <div class="item nomargin" style="padding-top:5px; margin-top:5px;">

              <div class="news_box_image">
              {if $article.image!=false}
              <img src="{#pt#}{$article.image}&amp;w=140" width="140" alt="{$article.imgalt}" title="{$article.imgtitle}" />
{else}
              <img src="images/pic1.gif" alt="" title="" />              
{/if}
              </div>
              <div class="text_container">
                <h2><a href="{$article.filename}.html" title="">{$article.title}</a></h2>
                <p class="date">{$article.artdate}</p>
                <p><b>{$article.intro|nl2br}</b></p>
                
                <a href="{$article.filename}.html" title="{$article.moretitle}" class="more">{$article.morelink}</a>
                <br class="clear" />
              </div>
              <br class="clear" />
            </div>
            {/foreach}	
            
                       
          </div>
          <div class="bottom"></div>  
        </div>
        <!--news box ends here-->
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
  <div class="footer-content">
    <p class="float_left"><b>Abacsiszauna.hu</b> 2010 Minden jog fenntartva!</p>

    <div class="links">
      <a href="{$impr}" title="Impresszum">Impresszum</a>&nbsp;|
      <a href="{$linkekFilename}" title="Linkek">Linkek</a>&nbsp;|
      <a href="{$contactFilename}" title="Kapcsolat">Kapcsolat</a>
    </div>

    <p class="float_right">
      <a title="Honlapkészítés" href="http://www.inteliart.hu/" target="_blank">Honlapkészítés</a> és <a title="Internet Marketing" href="http://www.inteliart.hu/internet-marketing.html" target="_blank">e-marketing</a>:  <a title="Honlapkészítés" href="http://www.inteliart.hu/inteliart-media.html" target="_blank">InteliArt</a>
    </p>
  </div>
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
