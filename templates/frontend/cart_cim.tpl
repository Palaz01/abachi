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
              <div class="vodor">
                  <img src="templates/images/dezsa.png" alt="Vödör">
              </div>
          </div>

          
          <div class="container">
            <div class="links">
              <a href="{$cartFilename}" title="" id="link1">
                <div class="cart_status_icon">
                    <img class="icon" src="templates/images/cart.svg" alt="cart">
                </div>
                <span>KOSÁR</span>
              </a>
              <a title="" id="link2" class="active">
                  <div class="cart_status_icon">
                      <img class="icon" src="templates/images/truck-white.svg" alt="truck">
                  </div>
                  <span>CÍM</span>
              </a>
              <a href="{$vszall}" title="" id="link3">
                  <div class="cart_status_icon">
                      <img class="icon" src="templates/images/home.svg" alt="home">
                  </div>
                  <span>SZÁLLÍTÁS</span>
              <a href="{$vfiz}" title="" id="link4">
                  <div class="cart_status_icon">
                      <img class="icon" src="templates/images/credit-card.svg" alt="credit-card">
                  </div>
                  <span>FIZETÉS</span>
              </a>
              <a href="javascript:void(0)" title="" onclick="document.review.submit();" id="link5">
                  <div class="cart_status_icon">
                      <img class="icon" src="templates/images/checked.svg" alt="checked">
                  </div>
                  <span>RENDELÉS</span>
              </a>

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

                         <p class="reg_or_login_text"> A vásárlás folytatásához regisztrálnia kell, vagy ha már regisztrált, akkor be kell jelentkeznie! </p>

                         <div class="registration_box">
                            <input type="text" name="loguser" id="loguser" placeholder="E-mail cím"/>
                            <input type="password" name="logpwd" id="logpwd" placeholder="Jelszó"/>
                         </div>
                        </td> 
                      </tr> 
                    </tbody> 
                  </table>
                </div>
                 <div class="submit reg_or_login_buttons">
                     <input class="pay" type="button"  onclick="document.cimmod.submit();" value="Regisztrál" />
                     <input class="pay" type="button"  onclick="document.login.login_email.value=document.getElementById('loguser').value; document.login.login_password.value=document.getElementById('logpwd').value; document.login.submit();  " value="Belépés" />
                 </div>
                 {/if}
                
                <div class="submit cart_buttons">
                  <a href="{$cartFilename}" title="">vissza a kosárhoz</a> 
                  
                  <input class="pay" type="submit" onclick="document.tovabb.submit();" value="SZÁLLÍTÁS" /> 
                  <input class="recount" type="submit" onclick="document.cimmod.submit();" value="MÓDOSÍT" /> 
                  <br class="clear" /> 
                </div> 
  	         </div>
          </div>

<div class="bottom"></div>
</div>



