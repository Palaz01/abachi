{include file='admin.header.tpl'}

{if isset($messages)&&sizeof($messages) != 0}
<div>
{$messages}
</div>
{/if}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      <form>
        <input type="button" name="new_article" id="new_item" value="Új főoldali doboz" onclick="javascript: document.location='admin.php?mod=mainpageboxedit';" class="admin-button" />
      </form>      
    </td>
    <td>
      <form>
        <input type="button" name="sort_article" id="sort_item" value="Dobozok sorrendjének szerkesztése" onclick="javascript: document.location='admin.php?mod=mainpageboxsort';" class="admin-button" />
      </form>
    </td>    
  </tr>
  <tr>
    <td>
      {include file='admin.my.button.delete.tpl'}      
    </td>    
    <td>
      {include file='admin.my.control.search.tpl'}
    </td>
  </tr>
</table>

<hr />

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>      
      <th>Doboz szöveg</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input name="idcb[]" id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.boxtext}</td>
        <td class="{$tdClass}"><input type="button" name="edititem-{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=mainpageboxedit&id={$row.id}';" class="admin-button" /></td>
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