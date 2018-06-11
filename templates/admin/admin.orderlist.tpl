{include file='admin.header.tpl'}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>    
    <td>
      {include file='admin.my.control.sort.tpl'}
    </td>
    <td>
      {include file='admin.my.control.search.tpl'}
    </td>  
  </tr>
     <tr>
    <td colspan="2">
      <center>        
        <form action="{$formaction}" method="post">
          {if $shownondel===false}
            <input type="hidden" name="shownondel" value="1" />
            <input type="submit" name="doshownondel" value="Törölt elemek megtekintése" class="admin-button" />
            {$hiddens}  
          {else} 
            <input type="hidden" name="shownondel" value="" />
            <input type="submit" name="doshownondel" value="Nem törölt elemek megtekintése" class="admin-button" />
            {$hiddens}
          {/if}
        </form>
      </center>
    </td>
  </tr> 

</table>

<hr />

<form action="{$formaction}" method="post" id="form">
  <table>
    <tr>            
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>      
      <th>Megrendelő neve</th>      
      <th>E-mail címe</th>      
      <th>Összérték</th>
      <th>Státusz</th>
      <th>Fizetési mód</th>
      <th>Megrendelés azonosító</th>
      <th>Dátum</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row}
      <tr>        
        <td><input id="id-{$row.id}" type="checkbox" /></td>
        <td>{$row.fullname}</td>        
        <td>{$row.email}</td>        
        <td>{$row.totalsum}</td>
        <td>{$orderStatuses[$row.status]}</td>
        <td>{$row.paymentmode}</td>
        <td>{$row.ordertextid}</td>
        <td>{$row.arrived}</td>
        <td><input type="button" name="editproject{$row.id}" value="Részletek" onclick="javascript: document.location='admin.php?mod=orderview&id={$row.id}';" class="admin-button" /></td>
      </tr>    
    {/foreach}
  </table>
</form>

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>




{include file='admin.footer.tpl'}
