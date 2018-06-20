{include file='header.tpl'}
<!--cart page starts here-->

<form action="{$reviewFilename}" method="post" id="review" name="review">
</form>
     <form name="checkout_address" action="{$reviewFilename}" method="post">
     <input type="hidden" name="action" value="process">

        <div class="cart_page">
          <div class="top">
              <h2>Kosár</h2>
              <div class="vodor">
                  <img src="templates/images/dezsa.png" alt="Vödör">
              </div>
          </div>

          
          <div class="container">
		  <div class="links">
		    <a href="{$cartFilename}" title="" id="link1" >
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/cart.svg" alt="cart">
                </div>
                <span>KOSÁR</span>
            </a>
		    <a href="{$vcim}" title="" id="link2">
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/truck.svg" alt="truck">
                </div>
                <span>CÍM</span>
            </a>
		    <a href="{$vszall}" title="" id="link3">
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/home.svg" alt="home">
                </div>
                <span>SZÁLLÍTÁS</span>
            </a>
		    <a href="{$vfiz}" title="" id="link4">
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/credit-card.svg" alt="credit-card">
                </div>
                <span>FIZETÉS</span>
            </a>
		    <a href="#" title="" class="active" id="link5">
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/checked-white.svg" alt="checked">
                </div>
                <span>RENDELÉS</span>
            </a>

		    <br class="clear" />
		  </div>
            
              {assign var='totalsumwithvat' value='0'}

	    {foreach from=$cartData item=row key=key}					  
	    {assign var='totalsumwithvat' value=`$totalsumwithvat+$row.sumwithvat`}
	    {/foreach}

     <div class="bg">
	<p>Címek</p>
	<br/>
	  <div style="float:left; margin-left:25px;">
	    <b>Számlázási cím:</b><br/>
	    {$billingAddress}
	  </div>
	  <div style="float:right; margin-right:25px;">
	  <b>Szállítási cím:</b><br/>
				{if $deliveryAddress!=''}
				  {$deliveryAddress}
				{else}
				  <b>Számlázási címmel megegyezik!</b>
				{/if}
	  </div>
	  <div style="clear:both"></div>            
<br/>
            <p>Szállítás módja</p><br/>
<div style="margin-left:25px">
      <b>{$fszolg}</b><br/>
      
 </div>
<br/>
  <p>Fizetés módja</p><br/>
<div style="margin-left:25px">
      <b>{$paymod}</b><br/>
      
 </div>
<br/>
            <p>Észrevételek a rendelésről:</p>
<div style="margin-left:25px">
                <textarea name="remark" wrap="soft" cols="60" rows="5"></textarea>
</div>
<br/>      
<p>Termékek</p>
 
                  {assign var='totalsumwithvat' value=$deliveryPrice}
                  {foreach from=$cartData item=row key=key}					  
                  <br/>
		    <div style="float:left; margin-left:25px">
                    {$row.quantity}&nbsp;x {$row.title}
		    </div>
		    <div style="float:right; margin-right:25px">
                     {$row.sumwithvat|commify:-1:',':'.'} Ft
		    </div>
		    <div style="clear:both"></div>
                  
                  {assign var='totalsumwithvat' value=`$totalsumwithvat+$row.sumwithvat`}
                  {/foreach}
                  <br/>
                      <div style="text-align:right; margin-right:25px"><b>Mindösszesen: {$totalsumwithvat|commify:-1:',':'.'} Ft</b></div>
           
</div>  
      <div class="submit"> 
             
                         <input class="pay" type="submit" value="RENDEL" />
<br class="clear" /> 
             </div>
      

    
    <input type="hidden" name="order" value="1" />
    
   
</div>
    <div class="bottom"></div>

</div>    
</form>

{literal}
<script type="text/javascript">
function submitForm(i) {  
  document.getElementById(i).value = '1';
  document.form.cart_quantity.submit();
}
</script>
{/literal}
    
{include file='footer.tpl'}    
