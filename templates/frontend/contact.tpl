{include file='header.tpl'}
<form name="contact_us" action="{$contactFilename}" method="post">
<div class="static_page">
          <div class="top">
            <h2>Kapcsolatfelvétel</h2>
            <div class="vodor"></div>
          </div>
          
          {include file='errors.tpl'}  
          
<div class="repeat">


 <div class="fck">
 {$kapcsszoveg}
 </div>
 
 <hr class="divide" />
 
              <div class="form">

                  <div>
                    <label>Név</label>

                    <input type="text" name="fullname" value="{$fullname}" />
                  </div>
                  
                  <div>
                    <label>E-mail</label>
                   <input type="text" name="email" value="{$email}" />
                  </div>  
                  
                  <div>
                    <label>Telefonszám</label>
                   <input type="text" name="telephone" value="{$telephone}" />
                  </div>
                  
                  <div class="textarea">
                    <label>Szöveg</label>

                    <textarea name="message" rows="" cols="">{$message}</textarea>
                  </div>  
                  
                  <div class="check">
                    <label>Ellenörző kód</label>
                    <img src="/botcheck2.php?r={$rstx}" />
                    <input name="checkbot" type="text" value=""  />
                  </div>   
                  
                  <div class="submit">
                    <input type="submit" value="ELKÜLDÉS" />

                  </div>                                                    
              </div>
</div>
          <div class="bottom">&nbsp;</div>
        </div>

    <input type="hidden" name="docontact" value="1" />
    </form>


    
{include file='footer.tpl'}    
