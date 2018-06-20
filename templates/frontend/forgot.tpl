{include file='header.tpl'}
<div class="registration_page">
  <div class="top">
    <h2>Elfelejtett jelszó</h2>
    <div class="vodor"></div>
  </div>

  <p class="form">
    {include file='errors.tpl'}

    <br />
    <div class="password_forgotten_page">
        <form name="password_forgotten" class="password_forgotten" action="{$forgotFilename}" method="post">
            <h2>Elfelejtettem a jelszavam !</h2>
            <p>Ha elfelejtette jelszavát, adja meg az e-mail címét és küldünk egy új jelszót<br />.</p>
            <div class="main"><input type="text" name="forgot_email" value="{$email}" placeholder="E-mail cím"/></div>
              <div class="submit">
                <input type="submit" value="Folytatás"/>
              </div>
              <input type="hidden" name="doforgot" value="1" />
        </form>
    </div>
</div>
<div class="registrationPageBottom">&nbsp;</div>



 

{include file='footer.tpl'}
