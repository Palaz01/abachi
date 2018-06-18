{include file='header.tpl'}
<form name="contact_us" action="{$contactFilename}" method="post" class="contact_page">
    <div class="static_page">
      <div class="top">
        <h2>Kapcsolatfelvétel</h2>
      </div>
      {include file='errors.tpl'}
        <div class="repeat">
            <div class="contact_page_text">
                <div class="google_map"></div>
                <div class="fck">
                    {$kapcsszoveg}
                </div>
            </div>



            <hr class="divide" />
              <div class="form">
                  <h2>Forduljon hozzánk bizalommal!</h2>
                  <p>Kérdését, véleményét, javaslatait az alábbi mezők kitöltésével juttathatja el hozzánk és munkatársaink hamarosan felveszik Önnel a kapcsolatot! Minden kérdésre a legjobb tudásunk szerint válaszolunk és megadjuk a szükséges információkat.</p>
                  <div>
                    <input type="text" name="fullname" value="{$fullname}" placeholder="Név"/>
                  </div>
                  <div>
                   <input type="text" name="email" value="{$email}" placeholder="E-mail"/>
                  </div>

                  <div>
                   <input type="text" name="telephone" value="{$telephone}" placeholder="Telefonszám"/>
                  </div>

                  <div class="textarea">
                    <textarea name="message" rows="" cols="" placeholder="Szöveg">{$message} </textarea>
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
    </div>
    <input type="hidden" name="docontact" value="1" />
</form>


    
{include file='footer.tpl'}    
