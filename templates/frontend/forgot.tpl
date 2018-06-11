{include file='header.tpl'}
<div class="registration_page">
  <div class="top">
    <h2>Elfelejtett jelszó</h2>
    <div class="vodor"></div>
  </div>

  <div class="form">
    {include file='errors.tpl'}
    
    <br />
    <form name="password_forgotten" action="{$forgotFilename}" method="post"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td><table border="0" width="100%" cellspacing="0" cellpadding="0" style="margin-left: 10px;">
              <tr>
    
                <td class="pageHeading">Elfelejtettem a jelszavam !</td>
              </tr>
            </table></td>
          </tr>
          
          <tr>
    
            <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
    
    
    </table>
    </td>
          </tr>
         
          <tr>
            <td><table border="0" width="100%" height="100%" cellspacing="1" cellpadding="2" class="infoBox" style="margin-left: 5px;">
              <tr class="infoBoxContents">
                <td><table border="0" width="100%" height="100%" cellspacing="0" cellpadding="2">
                  
                  <tr>
    
                    <td class="main" colspan="2">Ha elfelejtett jelszavát, adja meg az e-mail címét és küldünk egy új jelszót<br />.</td>
                  </tr>
                  
                  <tr>
                    <td class="main"><label>E-Mail cím:</label> <input type="text" name="forgot_email" value="{$email}" /></td>
    
                  </tr>
                  
                </table></td>
              </tr>
            </table></td>
          </tr>
           <tr>
            <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
              <tr class="infoBoxContents">
                <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td align="right">
                      <div class="submit">
                        <input type="submit" value="Folytatás" style="float: none; margin-left: 448px;" />
                      </div>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table>
        <input type="hidden" name="doforgot" value="1" />
    </form>
  </div>
<div class="registrationPageBottom">&nbsp;</div>
</div>

 

{include file='footer.tpl'}
