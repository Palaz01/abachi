<!--<div id="pa">
		<div class="pa_close"><a href="javascript:void(0)" onclick="hideAp()" style="width: 25px; height: 15px; display: block;">&nbsp;</a></div>
		<img src="akarmi/valentinnap.jpg" alt="special">
	</div>	

<td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>

            <td>
				<table cellspacing="0" cellpadding="5" width="100%">
					<tr>
						<td align="center">
						  {foreach from=$highlightedManufacturers item=row}
						   <a href="{$row.filename}.html"><img src="{#pt#}upload/manufacturer/{$row.image}&w=100&h=38" alt="{$row.imgalt}" title="{$row.imgtitle}" border="0"></a>&nbsp;
						  {/foreach}
						</td>
					</tr>
				</table>
				
		  <tr>
            <td><!-- new_products //-->

<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td class="t1"><img src="images/template/box/t1.png" border="0" alt="" width="17" height="28"></td>
    <td class="t2">Új termékek: {$monthName}</td>
    <td class="t3"><img src="images/template/box/t3.png" border="0" alt="" width="17" height="28"></td>
  </tr>
</table>
<table border="0" width="100%" cellspacing="0" cellpadding="0" class="contentBox">
  <tr>

    <td  class="m1"><img src="images/template/box/m1.png" border="0" alt="" width="17" height="1"></td>
    <td  class="contentBoxContents"><table border="0" width="100%" cellspacing="0" cellpadding="0" class="contentBoxContents">
    <tr>

  
  {foreach from=$productsOnMainpage item=row name=main}
  
    	
    {if $smarty.foreach.main.index%2==0}
      </tr>
      <tr>
    {/if}
    
    
    <td align="center" class="smallText" width="33%" valign="top">
<table width="275" cellspacing="0" cellpadding="0" style="border:1px solid #666666;margin-top:10px;background:#141414;">
<tr>
<td width="100" height="100" bgcolor="#ffffff" align="center">
										   <p style="padding-top:5px;padding-bottom:5px;">
										   <a href="{$row.filename}.html"><img src="{#pt#}{$row.image}&w=100&h=80" border="0" alt="{$row.imgalt}" title="{$row.imgtitle}" width="100" height="80"></a>
										   </p>
										  
										<p style="font-size:12px;font-weight:bold;font-family:Verdana, Arial, Helvetica, sans-serif;padding-bottom:10px;color:#56b8c7;">										  
										   
										  {$row.finalprice|commify:-1:',':'.'} Ft

</p>
										   
</td>
<td width="10"></td>
<td width="175" valign="top">

<table border="0" cellpadding="0" cellspacing="0" style="height:130px">
<tr><td valign="top" class="termekajanlo">
<p class="cimzos">										   

	<a href="{$row.filename}.html">{$row.title}</a>									   
</p>
<p class="leirasos">		

		{$row.description}
</p>
</td></tr>
<tr><td align="left">
 
				<a href="{$row.filename}.html"><img src="includes/languages/magyar/images/buttons/reszletek.jpg" border="0" alt="{$row.title}" width="70" height="19"></a>&nbsp;&nbsp;<input type="image" src="includes/languages/magyar/images/buttons/button_in_cart.gif" border="0" alt="" title="" onclick="javascript: document.location='{$row.addToCartFilename}.html';"></a>


</td></tr>
</table>				
</td>
</tr>
</table>	
										  </td>
  
  {/foreach}
  
  </tr>
  


	
										  </td>
  </tr>
</table>
</td>
    <td  class="m2"><img src="images/template/box/m2.png" border="0" alt="" width="17" height="1"></td>
  </tr>
  <tr>
    <td  class="d1"><img src="images/template/box/d1.png" border="0" alt="" width="17" height="14"></td>
    <td  class="d2"><img src="images/template/box/d2.png" border="0" alt="" width="1" height="14"></td>

    <td  class="d3"><img src="images/template/box/d3.png" border="0" alt="" width="17" height="14"></td>
  </tr>
</table>
<!-- new_products_eof //-->





</td>


    <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading" valign="middle">Friss hírek</td>            
          </tr>


	
					
	

  {foreach name=articles from=$articles item=article}    
    <tr><td>
			<h3 class="hircime"><a href="{$article.filename}.html">{$article.title}</a></h3>
			<span class="hirdatum">{$article.artdate}</span>
			{if $article.image!=false}
        <br>
        <img src="{#pt#}{$article.image}&w=120" width="120" alt="{$article.imgalt}" title="{$article.imgtitle}" class="hirkep" />
        <br>
      {/if}			  							
			<p class="hirbevezeto">{$article.intro|nl2br}</p>
			<a class="hirlinke" href="{$article.filename}.html">tovább &gt;&gt;</a>
		</td></tr>
		
  {/foreach}					
  
      </table></td>
    </tr> 


          </tr>
        </table></td>
    </table-->


