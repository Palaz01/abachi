{include file='header.tpl'}
<!--cart page starts here-->

<form action="{$reviewFilename}" method="post" id="review" name="review">
</form>

<form name="cart_quantity" action="{$cartFilename}" method="post">
        <div class="cart_page">
          <div class="top">
            <h2>Kosár</h2>
            <div class="vodor"></div>  
          </div>

          
          <div class="container">
            <div class="links">
              <a href="{$cartFilename}" title="" id="link1" class="active">1. KOSÁR</a>
              <a href="#" title="" id="link2">2. CÍM</a>
              <a href="#" title="" id="link3">3. SZÁLLÍTÁS</a>
              <a href="#" title="" id="link4">4. FIZETÉS</a>
              <a href="#" title="" id="link5">5. RENDELÉS</a>

              <br class="clear" />
            </div>
            
            <p><b>{$cartCount} db termék</b> van a kosaradban.</p>
              {assign var='totalsumwithvat' value='0'}
  
              <div class="item">
                <div class="bg">
                  <table cellpadding="0" cellspacing="0">
                   <tbody>
                      <tr>
                      <!-- img border="0" src="{#pt#}{$row.image}&h=100&w=80" alt="{$row.title}" title="{$row.title}" / -->
                        <th class="prod_name">Terméknév:</th>
                        <th class="price">Egységár:</th>
                        <th class="quantity">Db:</th>
                        <th class="overall">Összesen:</th>
                      </tr>
	  {foreach from=$cartData item=row key=key name=cart} 
	  {assign var='trCRészösszeg: lass' value='productListing-even'}	
	  {if $smarty.foreach.cart.index%2==0}{assign var='trClass' value='productListing-odd'}{/if} 
                      <tr>
                        <td class="prod_name">
                            <input type="submit" value="" class="submit" onclick="getElementById('basketQuantity[{$key}]').value='0'; submitForm('refresh'); "/>
                            <a href="{$row.filename}">{$row.title}</a>
                        </td>
                        <td class="price">{$row.pricewithvat|commify:-1:',':'.'} Ft</td>
                        <td class="quantity">
                          <input type="text" id="basketQuantity[{$key}]" name="basketQuantity[{$key}]" maxlength="3" size="4" value="{$row.quantity}" />

                        </td>
                        <td class="overall">{$row.sumwithvat|commify:-1:',':'.'} Ft</td>
                      </tr>
{assign var='totalsumwithvat' value=`$totalsumwithvat+$row.sumwithvat`}
{/foreach} 
                      <tr>
                        <td colspan="4" class="vegosszeg"><b>Összes termék: {$totalsumwithvat|commify:-1:',':'.'} Ft</b></td>
                      </tr>
                      <tr>
                        <td colspan="4" class="vegosszeg">
                          
                          <b>Összesen fizetendő:	{$totalsumwithvat|commify:-1:',':'.'} Ft</b>
                        </td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
         
                <div class="submit">
                  <a href="#" onClick="history.back();" title="">vásárlás folytatása</a>
		  <input type="hidden" name="review" id="review" value="0" />
		  <input type="hidden" name="refresh" id="refresh" value="0" />

                  <input class="pay" type="submit" value="FIZETÉS" onclick="javascript: submitForm('review');"/>
                  <input class="recount" type="submit" value="ÚJRASZÁMOL"  onclick="javascript: submitForm('refresh');"/>

                  <br class="clear" />
                </div>

            </div>

          </div>

          <div class="bottom"></div>
        </div>
        <!--cart page ends here-->
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
