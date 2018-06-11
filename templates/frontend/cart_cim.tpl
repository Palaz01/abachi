{include file='header.tpl'}
<!--cart page starts here-->
<form action="{$vszall}" method="post" id="tovabb" name="tovabb">
</form>
<form action="{$registerFilename}?goback={$vcim}" method="post" id="cimmod" name="cimmod">
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
              <a title="" id="link2" class="active">2. CÍM</a>
              <a href="{$vszall}" title="" id="link3">3. SZÁLLÍTÁS</a>
              <a href="{$vfiz}" title="" id="link4">4. FIZETÉS</a>
              <a href="javascript:void(0)" title="" onclick="document.review.submit();" id="link5">5. RENDELÉS</a>

              <br class="clear" />
             </div>
             
             <p>Kézbesítési információk</p> 
            
  	         <div class="item"> 
                <div class="bg"> 
                  <table cellpadding="0" cellspacing="0" width="688"> 
                    <tbody> 
                      <tr> 
                        <th>Számlázási cím</th> 
                      </tr> 
  
                      <tr> 
                        <td> 
  {if ($userbelepett)!=""}
                          <b>{$userbelepett}</b><br /> 
                          {$k_b_orszag}<br /> 
                          {$k_b_irszam} {$k_b_varos}<br /> 
                          {$k_b_cim}
{else}

<p align="center"> A vásárlás folytatásához regisztrálnia kell, vagy ha már regisztrált, akkor be kell jelentkeznie! </p>
 
 <div class="registration_box">
 <label>Email cím :</label><input type="text" name="loguser" id="loguser"/><br class="clear" />
 <label>Jelszó:</label><input type="password" name="logpwd" id="logpwd"/>
 </div>
 
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
                
                <div class="submit"> 
                  <a href="{$cartFilename}" title="">vissza a kosárhoz</a> 
                  
                  <input class="pay" type="submit" onclick="document.tovabb.submit();" value="SZÁLLÍTÁS" /> 
                  <input class="recount" type="submit" onclick="document.cimmod.submit();" value="MÓDOSÍT" /> 
                  <br class="clear" /> 
                </div> 
  	         </div>
          </div>

<div class="bottom"></div>
</div>

{include file='footer.tpl'}    
