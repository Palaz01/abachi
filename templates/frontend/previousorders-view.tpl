{include file='header.tpl'}

<div class="static_page previousOrdersViewPage" id="previous_orders_page" style="margin-bottom: 0;">
  <div class="top">
    <h2>Rendelési információk</h2>
    <div class="vodor"></div>
  </div>
  
  <div class="repeat">
  <table width="100%">
   <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">

        <tr>
  
          <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
            <tr>
              <td class="main" colspan="2"><b>{$orderStatuses[$orders.status]}</b></td>
              <td class="smallText">{$orders.arrived}</td>
              <td class="smallText" align="right"><b>Összesen:</b> {$orders.totalsum} Ft</td>
            </tr>
          </table></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
            <tr class="infoBoxContents">
              <td width="30%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                <tr>
                  <td class="main"><b class="title">Kézbesítési cím</b></td>
                </tr>
                <tr>
                  <td class="main">
                    {if $orders.deliverypostcode!=''}
                    {$orders.lastname} {$orders.forename}<br>
                    {$orders.deliverystreet}<br>
                    {$orders.deliverypostcode}  {$orders.deliverycity}<br>
                    {$orders.deliverycountry}, {$orders.deliverycounty}<br>
                    {else}
                    {$orders.lastname} {$orders.forename}<br>
                    {$orders.billingstreet}<br>
                    {$orders.billingpostcode}  {$orders.billingcity}<br>
                    {$orders.billingcountry}, {$orders.billingcounty}<br>
                    {/if}
                  </td>
                </tr>
                <tr>
                  <td class="main"><b>Szállítási költség: {$orders.deliveryprice} Ft</b></td>
                </tr>              
              </table></td>
              </tr>
              <tr>
              <td width="70%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tr>
  
                  <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr><td>&nbsp;</td></tr>
                    <tr>
                      <td class="main" colspan="3"><b class="title">Termék</b></td>
                    </tr>
                      {foreach from=$orderedItem item=row}
                      <tr>
                        <td class="main" align="right" valign="top" width="30">{$row.quantity}&nbsp;x</td>
                        <td class="main" valign="top">{$row.productname}</td>
                        <td class="main" align="right" valign="top">{$row.grosssum} Ft</td>
                      </tr>
                      {/foreach}
            
                  </table></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
        </tr>
  
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td class="main"><b class="title">Számlázási információk</b></td>
        </tr>
        <tr>
          <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
            <tr class="infoBoxContents">
              <td width="99%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                <tr><td>&nbsp;</td></tr>
                <tr>
                  <td class="main"><b>Számlázási cím</b></td>
                </tr>
  
                <tr>
                  <td class="main">
  
                  {if $orders.company!=''}                 
                  {$orders.company}
                  {else}
                  {$orders.lastname} {$orders.forename}
                  {/if}
                  <br>
                  {$orders.billingstreet}<br>
                  {$orders.billingpostcode}  {$orders.billingcity}<br>
                  {$orders.billingcountry}, {$orders.billingcounty}<br>
                  
                  </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                  <td class="main"><b>Fizetési mód</b></td>
  
                </tr>
                <tr>
                  <td class="main">{$orders.paymentmode}</td>
                </tr>
              </table></td>            
            </tr>
          </table></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
          <td class="main"><b>Megjegyzések:</b></td>
        </tr>
  
        <tr>
          <td class="smallText">
            <p>{$orders.remark|nl2br}</p>
          </td>
        </tr>
        <tr>
  
          <td><table border="0" width="100%" cellspacing="1" cellpadding="2" class="infoBox">
            <tr class="infoBoxContents">
              <td><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr><td>&nbsp;</td></tr>
                <tr>
                  <td><a class="previous_orders_check" href="{$previousordersFilename}">VISSZA</a></td>
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
