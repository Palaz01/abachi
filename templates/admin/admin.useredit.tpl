{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<h3>Statisztika</h3>

<table>
  <tr>
    <td>
      Regisztráció időpontja:
    </td>
    <td>
      {$regdate}
    </td>
  </tr>
  <tr>
    <td>
      Utolsó bejelentkezés időpontja:
    </td>
    <td>
      {$lastlogin}
    </td>
  </tr>
  <tr>
    <td>
      Bejelentkezések száma:
    </td>
    <td>
      {$loginnum}
    </td>
  </tr>  
</table>

<form action="{$formAction}" method="post" enctype="multipart/form-data">

<h3>Felhasználó adatai</h3>
<table>      
<tr>
  <td>
    Vezetéknév:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="lastname" value="{$lastname}" />
  </td>
</tr>      
<tr>
  <td>
    Keresztnév:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="forename" value="{$forename}" />
  </td>
</tr>  
<tr>
  <td>
    Nem:
  </td>        
  <td>
    <input type="radio" name="gender" {if $gender=='1'}checked="checked"{/if} id="g1" value="1" /><label for="g1">Férfi</label>
    <input type="radio" name="gender" {if $gender=='2'}checked="checked"{/if} id="g2" value="2" /><label for="g2">Nő</label>
  </td>
</tr>
<tr>
  <td>
    Cégnév:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="company" value="{$company}" />
  </td>
</tr>      
<tr>
  <td>
    Telefonszám:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="telephone" value="{$telephone}" />
  </td>
</tr>
<tr>
  <td>
    Faxszám:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="fax" value="{$fax}" />
  </td>
</tr>            
<tr>
  <td>
    E-mail cím:
  </td>        
  <td>
    <input style="width: 250px;" class="admin-text" type="text" name="email" value="{$email}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Irányítószám<br />(számlázási címhez):
  </td>        
  <td valign="top">
    <input style="width: 50px;" lass="admin-text" type="text" name="billingpostcode" value="{$billingpostcode}" />
  </td>
</tr>
<tr>
  <td valign="top">
    Ország<br />(számlázási címhez):
  </td>        
  <td valign="top">
    <select name="billingcountry">
      {foreach from=$cISO item=country}
        <option {if $billingcountry==$country}selected="selected"{/if} value="{$country}">{$country}</option>
      {/foreach}
    </select>
  </td>
</tr>      
<tr>
  <td valign="top">
    Város<br />(számlázási címhez):
  </td>        
  <td valign="top">
    <input class="admin-text" type="text" name="billingcity" value="{$billingcity}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Utca<br />(számlázási címhez):
  </td>        
  <td valign="top">
    <input style="width: 250px;" class="admin-text" type="text" name="billingstreet" value="{$billingstreet}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Megye<br />(számlázási címhez):
  </td>        
  <td valign="top">
    <input style="width: 200px;" class="admin-text" type="text" name="billingcounty" value="{$billingcounty}" />
  </td>
</tr>  
<tr>
  <td valign="top">
    Ország<br />(szállítási címhez):
  </td>        
  <td valign="top">
    <select name="deliverycountry">
      {foreach from=$cISO item=country}
        <option {if $deliverycountry==$country}selected="selected"{/if} value="{$country}">{$country}</option>
      {/foreach}
    </select>
  </td>
</tr>      
<tr>
  <td valign="top">
    Irányítószám<br />(szállítási címhez):
  </td>        
  <td valign="top">
    <input style="width: 50px;" class="admin-text" type="text" name="deliverypostcode" value="{$deliverypostcode}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Város<br />(szállítási címhez):
  </td>        
  <td valign="top">
    <input class="admin-text" type="text" name="deliverycity" value="{$deliverycity}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Utca<br />(szállítási címhez):
  </td>        
  <td valign="top">
    <input style="width: 250px;" class="admin-text" type="text" name="deliverystreet" value="{$deliverystreet}" />
  </td>
</tr>      
<tr>
  <td valign="top">
    Megye<br />(szállítási címhez):
  </td>        
  <td valign="top">
    <input style="width: 200px;" class="admin-text" type="text" name="deliverycounty" value="{$deliverycounty}" />
  </td>
</tr>     
    

</table>

{include file='admin.prevorder.tpl'}

<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=userlist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
