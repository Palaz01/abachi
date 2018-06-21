{include file='header.tpl'}
<div class="static_page hirlevel_page" style="margin-bottom: 0;">
          <div class="top">
            <h2>Hírlevél feliratkozás</h2>
            <div class="vodor"></div>
          </div>
<div class="repeat">
  <div class="fck hirlevel_title">
    {$data}
  </div>

  <div class="form hirlevel">
    <form action="{$hirlevel}" method="post" >
      <div>
        <input type="text" name="hirlenev" value="{$userbelepett}" placeholder="Név"/><br/>
      </div>
      
      <div>
        <input type="text" name="hirlemail" value="{$userbelepettemail}" placeholder="E-mail cím"/>
      </div>
      <div class="accept flex">
        <div class="custom_checkbox">
          <img src="templates/images/checked.svg" alt="">
        </div>
        <input type="checkbox" class="checkbox">
        <p>Elfogadom az adatvédelemre és az adatkezelésre vonatkozó szabályokat. </p>
      </div>
      <input type="hidden" name="dod" value="feliratkoz" />
      
      <div class="submit">
        <input type="submit" value="FELIRATKOZÁS" />
      </div>
    </form>
  </div>
</div>
</div>
<div class="registrationPageBottom"></div>
{include file='footer.tpl'}
