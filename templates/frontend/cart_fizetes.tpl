{include file='header.tpl'}
<!--cart page starts here-->
<form action="{$vfiz}" method="post" id="tovabb" name="tovabb">
<input type="hidden" name="vszm" id="vszm" value="{$vszm}" />
</form>
<form action="{$registerFilename}" method="post" id="cimmod" name="cimmod">
</form>
<form action="{$reviewFilename}" method="post" id="review" name="review">
</form>

<form name="dejo" id="dejo" action="{$reviewFilename}" method="post">
        <div class="cart_page">
          <div class="top">
            <h2>Kosár</h2>
            <div class="vodor"></div>  
          </div>

          
          <div class="container">
            <div class="links">
              <a href="{$cartFilename}" title="" id="link1">
                  <div class="cart_status_icon"></div>
                  <span>KOSÁR</span>
              </a>
              <a href="{$vcim}" title="" id="link2">
                  <div class="cart_status_icon"></div>
                  <span>CÍM</span>
              </a>
              <a href="{$vszall}" title="" id="link3">
                  <div class="cart_status_icon"></div>
                  <span>SZÁLLÍTÁS</span>
              </a>
              <a href="#" title="" id="link4"  class="active">
                  <div class="cart_status_icon"></div>
                  <span>FIZETÉS</span>
              </a>
              <a href="javascript:void(0)" title="" onclick="document.dejo.submit();" id="link5">
                  <div class="cart_status_icon"></div>
                  <span>RENDELÉS</span>
              </a>

              <br class="clear" />
            </div>
            
            <p>Fizetés</p>
              {assign var='totalsumwithvat' value='0'}
  
              <div class="item">
                <div class="bg">
                  <table cellpadding="0" cellspacing="0" width="688">
                    <tbody>
                      <tr>
				        <td>
                            <div class="select_payment">
                              <div>
                                  <p>Fizetés módja</p>
                                  <select name="Válasszon fizetési módot" id="">
                                      <option value="">egy</option>
                                      <option value="">kettő</option>
                                      <option value="">három</option>
                                  </select>
                              </div>
                              <!--{foreach from=$paymentModes item=paymentMode key=key}
                                      <input class="fizetes_radio_button" type="radio" name="paymentmode" value="{$key}" id="pmr{$key}" {if $paymod==$key}checked="checked"{/if}><b>{$paymentMode}</b>

                                      <br/>
                              {/foreach}-->
                            </div><br/>
                        </td>
                      </tr>
                      <tr>
                        <th>Fizetési információk</th>
                      </tr>
                      <tr>
                        <td class="fck payment_information">
                            {$fleiras}
                          <p>
                              <br />
                              Banki átutalás esetén kérjük tüntesse fel az átutalás közlemény mezőjében az alábbi megrendelési azonosítót:
                              <br />
                              <b>{$noOfOrder}</b>
                          </p>
                        </td>
                      </tr>
		            </tbody>
                  </table>
		        </div>
		
         
                <div class="submit cart_buttons">
                  <a href="javascript:void(0)" onClick="location.href='{$cartFilename}';" title="">Vissza a kosárhoz</a>
                  <input type="hidden" name="review" id="review" value="0" />
                  <input type="hidden" name="refresh" id="refresh" value="0" />
                  <input class="pay" type="submit" value="RENDELÉS" onclick="document.dejo.submit();"/>

                  <br class="clear" />
                </div>

            </div>

          </div>
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
