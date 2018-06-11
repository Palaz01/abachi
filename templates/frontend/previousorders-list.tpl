{include file='header.tpl'}


<div class="static_page" id="previous_orders_page" style="margin-bottom: 0;">
  <div class="top">
    <h2>Megrendelések előzményei</h2>
    <div class="vodor"></div>
  </div>
  
  <div class="repeat">
    <table width="100%">
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
    
            <td>
              <table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
                <tr class="infoBoxContents">
                  <td><table border="0" width="100%" cellspacing="2" cellpadding="4" class="item">
                    {foreach from=$orders item=row}
                    
                      <tr class="moduleRow">
                        <td class="main"><b>{$row.arrived}</b></td>
                        <td class="main"><b>{$orderStatuses[$row.status]}</b></td>
                        <td class="main" align="right">{$row.totalsum} Ft</td>
                        <td class="main" align="right">{$row.deliveryprice} Ft</td>
                        <td class="main" align="right"><a class="previous_orders_check" href="{$row.filename}">MEGTEKINTÉS</a></td>
                      </tr>
    
                    {foreachelse}
                      <tr>
                        <td class="main">Ön még nem rendelt nálunk.</td>
                      </tr>
                    {/foreach}
    
                    
                  </table></td>
    
                </tr>
              </table>
            </td>
          </tr>

          <tr>
            <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
    
              <tr class="infoBoxContents">
                <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td><a class="previous_orders_check" href="{$usercenterFilename}">VISSZA</a></td>
                  </tr>
                </table></td>
              </tr>
    
            </table></td>
          </tr>
        </table></td>
     </table>

  </div> 
</div>
<div class="registrationPageBottom"></div>

{include file='footer.tpl'}