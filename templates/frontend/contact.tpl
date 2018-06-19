{include file='header.tpl'}
<form name="contact_us" action="{$contactFilename}" method="post" class="contact_page">
    <div class="static_page">
      <div class="top">
        <h2>Kapcsolatfelvétel</h2>
      </div>
      {include file='errors.tpl'}
        <div class="repeat">
            <div class="contact_page_text">
                <div class="google_map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2689.780774714936!2d19.330498215630602!3d47.61095227918494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4741ceca6b288a7f%3A0x9f5517e28ce3a9bb!2sAbachi+Welness+kft!5e0!3m2!1shu!2shu!4v1529402487399" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
                </div>
                <div class="our_contacts">
                    <div class="contact_abachi_logo">
                        <img src="" alt="">
                    </div>
                    <strong>Abachi Wellness Kft.</strong>
                    <p>Adószám: 24316316-2-13</p>
                    <p>Bank: 12021006-01388274-00100002</p>
                    <p>Cím: 2100 Gödöllő, Haraszti út Berger udvar</p>
                    <p>Telefon: +36703355049</p>
                    <p>E-mail: info@abachiszauna.hu</p>
                </div>
                <!--<div class="fck">
                    {$kapcsszoveg}
                </div>-->
            </div>



            <hr class="divide" />
              <div class="form">
                  <h2>Forduljon hozzánk bizalommal!</h2>
                  <p>Kérését, véleményét, javaslatait az alábbi mezők kitöltésével juttathatja el hozzánk és munkatársaink hamarosan felveszik Önnel a kapcsolatot! Minden kérdésre a legjobb tudásunk szerint válaszolunk és megadjuk a szükséges információkat.</p>
                  <div class="text_inputs">
                       <input type="text" name="fullname" value="{$fullname}" placeholder="Név"/>
                       <input type="text" name="email" value="{$email}" placeholder="E-mail"/>
                       <input type="text" name="telephone" value="{$telephone}" placeholder="Telefonszám"/>
                  </div>
                  <div class="textarea">
                    <textarea name="message" rows="" cols="" placeholder="Szöveg">{$message} </textarea>
                  </div>

                  <div class="check">
                    <label>Kérjük írja be az ellenőrző kódot</label>
                    <div class="flex">
                        <img src="/botcheck2.php?r={$rstx}" />
                        <input name="checkbot" type="text" value=""/>
                    </div>
                  </div>

                  <div class="submit">
                      <div class="accept flex">
                          <input type="checkbox">
                          <p>Elfogadom az adatvédelemre és az adatkezelésre vonatkozó szabályokat. </p>
                      </div>
                      <input type="submit" value="ELKÜLDÉS" />
                  </div>
              </div>
        </div>
    </div>
    <input type="hidden" name="docontact" value="1" />
</form>


    
{include file='footer.tpl'}    
