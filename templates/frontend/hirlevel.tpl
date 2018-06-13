{include file='header.tpl'}
<div class="static_page" style="margin-bottom: 0;">
          <div class="top">
            <h2>Hírlevél feliratkozás</h2>
          </div>
<div class="repeat">
  <div class="fck">
    {$data}
  </div>
  
  <hr class="divide" />
  
  <div class="form">
    <form action="{$hirlevel}" method="post" >
      <div>
        <label>Név:</label> <input type="text" name="hirlenev" value="{$userbelepett}" /><br/>
      </div>
      
      <div>
        <label>E-Mail cím:</label> <input type="text" name="hirlemail" value="{$userbelepettemail}" />
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
