{include file='header.tpl'}
<!--cart page starts here-->
{literal}
<script type="text/javascript">
function checkit()
{
  if (document.getElementById("cimmoder").value=="MÓDOSÍT")
  {
    document.getElementById("cimmoder").value="MENTÉS";
    document.getElementById("deliverystreet").disabled=false;
    document.getElementById("deliverycity").disabled=false;
    document.getElementById("deliverycountry").disabled=false;
    document.getElementById("deliverypostcode").disabled=false;
  } else {
    var street=document.getElementById("deliverystreet").value;
    var city=document.getElementById("deliverycity").value;
    var orszag=document.getElementById("deliverycountry").value;
    var irsz=document.getElementById("deliverypostcode").value;
    
    if (street!="" && city!="" && orszag!="" && irsz!="")
    {
      document.cimmod.tempvaros.value=city;
      document.cimmod.tempstreet.value=street;
      document.cimmod.tempirsz.value=irsz;
      document.cimmod.temporszag.value=orszag;
      
      document.cimmod.submit();
    } else {
      alert("Minden mező kitöltése kötelező!");
    }
    
    
  }
}
</script>

{/literal}
<form action="{$vfiz}" method="post" id="tovabb" name="tovabb">
<input type="hidden" name="vszm" id="vszm" value="{$vszm}" />
</form>
<form action="{$vszall}" method="post" id="cimmod" name="cimmod">
  <input type="hidden" name="tempcim" value="tempcim" />
  <input type="hidden" name="tempvaros" value="0" />
  <input type="hidden" name="tempstreet" value="0" />
  <input type="hidden" name="tempirsz" value="0" />
  <input type="hidden" name="temporszag" value="0" />  
</form>

<form action="{$reviewFilename}" method="post" id="review" name="review">
</form>

        <div class="cart_page">
          <div class="top">
            <h2>Kosár</h2>
            <div class="vodor"></div>  
          </div>

          
          <div class="container">
            <div class="links">
              <a href="{$cartFilename}" title="" id="link1">1. KOSÁR</a>
              <a href="{$vcim}" title="" id="link2">2. CÍM</a>
              <a title="" id="link3" class="active">3. SZÁLLÍTÁS</a>
              <a href="javascript:void(0)" title="" onclick="document.getElementById('vszm').value=document.getElementById('szmod').value; document.tovabb.submit();" id="link4">4. FIZETÉS</a>
              <a href="javascript:void(0)" title="" onclick="document.review.submit();" id="link5">5. RENDELÉS</a>

              <br class="clear" />
            </div>
             <p>Szállítási információk</p> 
            
	      <div class="item"> 
                <div class="bg"> 
                  <table cellpadding="0" cellspacing="0" width="688"> 
                    <tbody> 
                      <tr> 
                        <th>Szállítási cím</th> 
                      </tr> 
  
                      <tr> 
                        <td> 
{if ($userbelepett!="")}
<div class="registration_page"  style="width:100%">
 <div class="form">
           <div class="item">
                <h3>{$userbelepett}</h3>
                <p>
		<div>
                  <label>Utca, házszám:</label>
                  <input type="text"  disabled style="width:50%; height:22px;" id="deliverystreet" name="deliverystreet" value="{$k_d_cim}" />
                  <span>Kötelező kitölteni</span>
                </div>
                
                <div>
                  <label>Irányítószám:</label>
                  <input type="text" disabled id="deliverypostcode" style="width:50%; height:22px;" name="deliverypostcode" value="{$k_d_irszam}" />
                  <span>Kötelező kitölteni</span>
                </div> 
                
                <div>
                  <label>Város:</label>
                  <input type="text" disabled id="deliverycity" style="width:50%; height:22px;" name="deliverycity" value="{$k_d_varos}" />
                  <span>Kötelező kitölteni</span>
                </div> 

                <div>
                  <label>Ország:</label>
                  <select disabled id="deliverycountry" style="width:50%; height:22px;" name="deliverycountry">
							      {foreach from=$cISO item=country}
							        <option {if $k_d_orszag==$country}selected="selected"{/if} value="{$country}">{$country}</option>
							      {/foreach}
							    </select>
                </div> 
              </div>  
</div>
</div>
			  {else}

<p align="center"> A vásárlás folytatásához regisztrálnia kell, vagy ha már regisztrált, akkor be kell jelentkeznie! </p>
 <div class="registration_box">
 <label>Email cím :</label><input type="text" name="loguser" id="loguser" style="width:150px"/><br class="clear" />
 <label>Jelszó:</label><input type="password" name="logpwd" id="logpwd" style="width:150px"/>
 </table>
 
 <div class="submit">

  <input class="pay" type="button" style="border:none" onclick="document.cimmod.submit();" value="Regisztrál" />
 <input class="pay" type="button" style="border:none" onclick="document.login.login_email.value=document.getElementById('loguser').value; document.login.login_password.value=document.getElementById('logpwd').value; document.login.submit();  " value="Belépés" />
 </div>
{/if}
			  
                        </td> 
                      </tr> 
                    </tbody> 
                  </table> 
                </div> 
		
                <script>
		  
		 {literal}
		  function changeinfo()
                    {
{/literal}
		  var atval=new Array();
		  var szmek=new Array();
		 		  
		 {$valtozok1}
		 {$valtozok2}
		      ii=document.getElementById('szmod').value;
		      szoveg=atval[ii];
		      cimke=szmek[ii];
		      //document.getElementById('cmk').innerHTML=cimke;
		      //document.getElementById('vallal').innerHTML=szoveg;
{literal}
		    }
		</script>
		{/literal}
		<div class="bg"> 
                  <table cellpadding="0" cellspacing="0" width="688"> 
                    <tbody> 
			<tr> 
			  <th>Szállítás módja</th> 
			</tr> 
     
                      <tr> 
                        <td> 
                          <select id="szmod" name="szmod" onclick="changeinfo()"> 
                            <option value="-1">Válasszon kézbesítési formát</option> 
                            {$szallok}
                          </select> 
                          
                          <span><b>Kiszállítás díja:</b><a href="{$pgDeliveryFilename}" target="_blank" htitle="Szállítási információk">Szállítási információkért kattintson ide</a></span> 
                          
                          <br class="clear" /> 
                        </td> 
                      </tr>                      
                    </tbody> 
                  </table> 
                </div>

                <div class="submit"> 
                  <a href="{$cartFilename}" title="">vissza a kosárhoz</a> 
                  
                  <input class="pay" type="submit" onclick="document.getElementById('vszm').value=document.getElementById('szmod').value;  document.tovabb.submit();" value="FIZETÉS" /> 
                  <input class="recount" type="submit" id="cimmoder" onclick="javascript:checkit();" value="MÓDOSÍT" /> 
                  <br class="clear" /> 
                </div> 
	      </div>
</div>
<div class="bottom"></div>
</div>

{include file='footer.tpl'}    