{include file='header.tpl'}

<form name="create_account" action="{$modifyFilename}" method="post">
    <div class="registration_page">
      <div class="top">
        <h2>Adataim módosítása</h2>
        
        <div class="vodor"></div>
      </div>
              
	           
	  <div class="form">
	    
	      {include file='errors.tpl'}
              <div class="item">
                <h3>Személyes adatok</h3>

                <div class="checkbox">
                  <p>Neme:</p>
                  <input type="radio" name="gender" value="1" {if $gender==1}checked="checked"{/if} />
                  <label>Férfi</label>
                  
                  <input type="radio" name="gender" value="2" {if $gender==2}checked="checked"{/if} />
                  <label>Nő</label>
                </div>
                
                <div>
                  <label>Vezetéknév:</label>
                  <input type="text" name="lastname" value="{$lastname}" />
                  <span>Kötelező kitölteni</span>
                </div>
                
                <div>
                  <label>Keresztenév:</label>
                  <input type="text" name="forename" value="{$forename}" />
                  <span>Kötelező kitölteni</span>
                </div>
                
                <div>
                  <label>E-mail cím:</label>
                  <input type="text" name="email" value="{$email}" />
                  <span>Kötelező kitölteni</span>
                </div>
              </div>
              
		          <div class="item">
                <hr class="divide" />
                
                <h3>Cégadatok</h3>
                
                
                <div>
                  <label>A cég neve:</label>
                  <input type="text" name="company" value="{$company}" />
                </div>  

                              
              </div>    
               
              <div class="item">
                <hr class="divide" />
                
                <h3>Számlázási cím</h3>
                
                <div>
                  <label>Utca, házszám:</label>
                  <input type="text" name="billingstreet" value="{$billingstreet}" />
                  <span>Kötelező kitölteni</span>
                </div>
                
                <div>
                  <label>Irányítószám:</label>
                  <input type="text" name="billingpostcode" value="{$billingpostcode}" />
                  <span>Kötelező kitölteni</span>
                </div> 
                
                <div>
                  <label>Város:</label>
                  <input type="text" name="billingcity" value="{$billingcity}" />
                  <span>Kötelező kitölteni</span>
                </div> 
                
                <div>
                  <label>Megye:</label>
                  <input type="text" class="text" name="billingcounty" value="{$billingcounty}" />
                  <span>Kötelező kitölteni</span>
                </div>  
		<div>
                  <label>Ország:</label>
                   <select name="billingcountry">
							      {foreach from=$cISO item=country}
							        <option {if $billingcountry==$country}selected="selected"{/if} value="{$country}">{$country}</option>
							      {/foreach}
							    </select>
		<span>Kötelező kitölteni</span>
                </div>                                                                                
              </div>
              
              
              <div class="item">
                <hr class="divide" />
                
                <h3>Szállítási cím</h3>
                
                
                <div>
                  <label>Utca, házszám:</label>
                  <input type="text" name="deliverystreet" value="{$deliverystreet}" />
                  <span>Kötelező kitölteni</span>
                </div>
		<div>
		<label>Irányítószám:</label>
                  <input type="text" name="deliverypostcode" value="{$deliverypostcode}" />
                  <span>Kötelező kitölteni</span>
                </div> 
                
                <div>
                  <label>Város:</label>
                  <input type="text" name="deliverycity" value="{$deliverycity}" />
                  <span>Kötelező kitölteni</span>
                </div> 
                
                <div>
                  <label>Megye:</label>
                  <input type="text" class="text" name="deliverycounty" value="{$deliverycounty}" />
                  <span>Kötelező kitölteni</span>
                </div>  
                
                <div>
                  <label>Ország:</label>
                  <select name="deliverycountry">
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
                  <label>Telefonszám:</label>
                  <input type="text" name="telephone" value="{$telephone}" />
                  <span>Kötelező kitölteni</span>
                </div>  
                
                <div>
                  <label>Fax szám:</label>
                  <input type="text" name="fax" value="{$fax}" />
                  <span>Kötelező kitölteni</span>
                </div>                                  
              </div>
              
              <div class="item">
                <hr class="divide" />
                
                <h3>Az Ön jelszava</h3>  
                 
		A jelszóval kapcsolatos mezőket csak akkor kell kitölteni, ha meg akarjuk változtatni azt!
		<br>
		A szállítási címet csak akkor kell kitölteni, ha a számlázási és a szállítási cím eltér egymástól.  <br/><br/>    
		<div>
                  <label>Jelszó:</label>
                  <input type="password" name="opassword" value="" />
                  <span>Kötelező kitölteni</span>
                </div>  
            <div>
                  <label>Jelszó:</label>
                  <input type="password" name="password1" value="{$password1}" />
                  <span>Kötelező kitölteni</span>
                </div>  
                
                <div>
                  <label>Jelszó megerősítés:</label>
                  <input type="password" name="password2" value="{$password2}" />
                  <span>Kötelező kitölteni</span>
                </div>                                  
              </div>
	     
		<input type="hidden" name="domodify" value="1" />           
              <div class="submit">

                <input type="submit" value="Folytatás" />
              </div>

          </div>
        </div>
        
        <div class="registrationPageBottom"></div>
        <!--registration page ends here-->
            </form>

{include file='footer.tpl'}
