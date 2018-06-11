{include file='admin.header.tpl'}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td colspan="3">
      {include file='admin.my.control.sort.tpl'}
    </td>    
  </tr>
</table>

<hr />

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th>&nbsp;</th>      
      <th>Fájlnév</th>      
      <th>Meta title</th>
      <th>Meta description</th>
      <th>Meta keywords</th>
      <th>Meta H1</th>
      <th>&nbsp;</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.filename}.html</a></td>
        <td class="{$tdClass}">{$row.title}</td>        
        <td class="{$tdClass}">{$row.description}</td>
        <td class="{$tdClass}">{$row.keywords}</td>
        <td class="{$tdClass}">{$row.header}</td>
        <td class="{$tdClass}"><input type="button" name="open{$row.id}" value="Megnyitás" onclick="javascript: popUp('{$row.filename}.html');" class="admin-button" /></td>
        <td class="{$tdClass}"><input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=metaedit&id={$row.id}';" class="admin-button" /></td>
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
