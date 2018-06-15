{include file='header.tpl'}
<script>
{literal} 
function atrendez()
{
var ii;
ii=document.getElementById('katt').checked;

if (ii==1){
document.getElementById('deliverystreet').value=document.getElementById('billingstreet').value;
document.getElementById('deliverypostcode').value=document.getElementById('billingpostcode').value;
document.getElementById('deliverycity').value=document.getElementById('billingcity').value;
document.getElementById('deliverycounty').value=document.getElementById('billingcounty').value;
document.getElementById('deliverycountry').value=document.getElementById('billingcountry').value;
}
}

{/literal} 
</script>
<form name="create_account" action="{$registerFilename}" method="post">
	  <div class="registration_page">
      <div class="top">
        <h2>Regisztráció</h2>
        
        <div class="vodor"></div>
      </div>
      
          <div class="form">
          
          {include file='errors.tpl'}          
            
              <div class="item">
                <h3>Személyes adatok</h3>

                <div class="checkbox flex ">
                  <p>Neme:</p>
                  <input type="radio" name="gender" value="1" {if $gender==1}checked="checked"{/if} />
                  <label>Férfi</label>
                  
                  <input type="radio" name="gender" value="2" {if $gender==2}checked="checked"{/if} />
                  <label>Nő</label>
                </div>
                
                <div>
                  <input type="text" name="lastname" value="{$lastname}" placeholder="Vezetéknév"/>
                </div>
                
                <div>
                  <input type="text" name="forename" value="{$forename}" placeholder="Keresztnév"/>
                </div>
                
                <div>
                  <span class="errormessage">Kérjük helyes e-mail címet adjon meg!</span>
                  <i class="fa fa-exclamation"></i>
                  <input type="text" name="email" value="{$email}" placeholder="E-mail cím"/>
                </div>
              </div>
              
              
              
              
              <div class="item">
                <hr class="divide" />
                
                <h3>Cégadatok</h3>
                
                <div>
                  <input type="text" name="company" value="{$company}" placeholder="A cég neve"/>
                </div>  
                

              </div>                 
              
              <div class="item">
                <hr class="divide" />              
                <h3>Számlázási cím</h3>              
    
              
              
              
                <div>
                  <input type="text" id="billingstreet" name="billingstreet" value="{$billingstreet}" placeholder="Utca, házszám"/>
                </div>
                
                <div>
                  <input type="text" id="billingpostcode" name="billingpostcode" value="{$billingpostcode}" placeholder="Irányítószám"/>
                </div> 
                
                <div>
                  <input type="text" id="billingcity" name="billingcity" value="{$billingcity}" placeholder="Város"/>
                </div> 
                
                <div>
                  <input type="text" id="billingcounty" class="text" name="billingcounty" value="{$billingcounty}" placeholder="Megye"/>
                </div>  
                
                <div>
                   <select id="billingcountry" name="billingcountry">
                      {foreach from=$cISO item=country}
                        <option {if $billingcountry==$country}selected="selected"{/if} value="{$country}">{$country}</option>
                      {/foreach}
                    </select>
                </div>                                                                                
              </div>
              
              
              
              <div class="item">
                <hr class="divide" />
                
                <h3>Szállítási cím</h3>
                
		<div class="checkbox">
                <input type="checkbox"  id="katt" onclick="atrendez()"/> A szállítási és számlázási cím megegyezik
		</div>
		<div>
                  <input type="text" id="deliverystreet" name="deliverystreet" value="{$deliverystreet}" placeholder="Utca, házszám"/>
                </div>
                
                <div>
                  <input type="text" id="deliverypostcode" name="deliverypostcode" value="{$deliverypostcode}" placeholder="Irányítószám"/>
                </div> 
                
                <div>
                  <input type="text" id="deliverycity" name="deliverycity" value="{$deliverycity}" placeholder="Város"/>
                </div> 
                
                <div>
                  <input type="text" id="deliverycounty" class="text" name="deliverycounty" value="{$deliverycounty}" placeholder="Megye"/>
                </div>  
                
                <div>
                  <label>Ország:</label>
                  <select id="deliverycountry" name="deliverycountry">
                    {foreach from=$cISO item=country}
                      <option {if $billingcountry==$country}selected="selected"{/if} value="{$country}">{$country}</option>
                    {/foreach}
                  </select>
                </div> 
              </div> 
              
              <div class="item">                
                <hr class="divide" />
                

                <h3>Elérhetőségi információk</h3>                
                      
              
              
              
                <div>
                  <input type="text" name="telephone" value="{$telephone}" placeholder="Telefonszám"/>
                </div>  
                
                <div>
                  <input type="text" name="fax" value="{$fax}" placeholder="Fax szám"/>
                  <span>&nbsp;</span>
                </div>                                  
              </div>
              
              
              
              <div class="item">
                <hr class="divide" />
                
                <h3>Az Ön jelszava</h3>  
  
                
                <div>
                  <input type="password" name="password1" value="{$password1}" placeholder="Jelszó"/>
                </div>  
                
                <div>
                  <input type="password" name="password2" value="{$password2}" placeholder="Jelszó megerősítés"/>
                </div>                                  
              </div>

              <div class="star_text"><p>A *-al jelölt mezők kitöltése kötelező.</p></div>
              
              
		<input type="hidden" name="regstarted" value="1" />              
              <div class="submit">

                <input type="submit" value="TOVÁBB" />
                
                
              </div>
              
              
          </div>
        </div>
        <div class="registrationPageBottom"></div>
        <!--registration page ends here-->
            </form>
{include file='footer.tpl'}
