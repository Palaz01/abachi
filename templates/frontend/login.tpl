{include file='header.tpl'}
<div class="static_page">
          <div class="top">
            <h2>Belépés</h2>
          </div>
<div class="repeat">
    <form name="login" action="{$loginFilename}" method="post">
     <table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>

            <td class="pageHeading">Üdvözöljük. Kérem jelentkezzen be.</td>
          </tr>
        </table></td>
      </tr>
      <tr>

        <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
{include file='errors.tpl'}

</table>
<table border="0" width="100%" cellspacing="0" cellpadding="2">

          <tr>
            <td class="main" width="50%" valign="top"><b>Új vásárló</b></td>
            <td class="main" width="50%" valign="top"><b>Visszatérő vásárló</b></td>
          </tr>
          <tr>
            <td width="50%" height="100%" valign="top"><table border="0" width="100%" height="100%" cellspacing="1" cellpadding="2" class="infoBox">
              <tr class="infoBoxContents">
                <td><table border="0" width="100%" height="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="main" valign="top">Új vásárló vagyok.<br><br>Amennyiben regisztrálja magát a(z) Webparfüméria webáruházban, gyorsabban vásárolhat, frissen tarthatja megrendeléseit, és kezelheti korábbi megrendeléseit.</td>
                  </tr>
                  <tr>
                    <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
                      <tr>
                        <td width="10"><img src="images/pixel_trans.gif" border="0" alt="" width="10" height="1"></td>
                        <td align="right"><a href="{$registerFilename}"><img src="includes/languages/magyar/images/buttons/button_continue.gif" border="0" alt="Folytatás" title=" Folytatás " width="70" height="19"></a></td>
                        <td width="10"><img src="images/pixel_trans.gif" border="0" alt="" width="10" height="1"></td>
                      </tr>
                    </table></td>

                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="50%" height="100%" valign="top"><table border="0" width="100%" height="100%" cellspacing="1" cellpadding="2" class="infoBox">
              <tr class="infoBoxContents">
                <td><table border="0" width="100%" height="100%" cellspacing="0" cellpadding="2">
                  
                  <tr>
                    <td class="main" colspan="2">Visszatérő vásárló vagyok.</td>
                  </tr>
                  <tr>

                    <td class="main"><b>E-Mail cím:</b></td>
                    <td class="main"><input type="text" name="login_email" value="{$email}" /></td>
                  </tr>
                  <tr>
                    <td class="main"><b>Jelszó:</b></td>
                    <td class="main"><input type="password" name="login_password" value="" /></td>
                  </tr>
                  
                  <tr>
                    <td class="smallText" colspan="2"><a href="{$forgotFilename}">Elfelejtette jelszavát ? Kattintson ide.</a></td>
                  </tr>

                  <tr>
                    <td colspan="2"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                      <tr>
                        
                        <td align="right"><input type="image" src="includes/languages/magyar/images/buttons/button_login.gif" border="0" alt="Bejelentkezés" title=" Bejelentkezés "></td>
                        
                      </tr>
                    </table></td>
                  </tr>

                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table>
 
   <input type="hidden" name="dologin" value="1" />
    </form>
       </div>
<div class="bottom">&nbsp;</div>
 
</div>
{include file='footer.tpl'}
