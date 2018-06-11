
{include file='admin.header.tpl'}

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      <form>
        <input type="button" name="new_article" id="new_article" value="Új termékcsoport" onclick="javascript: document.location='admin.php?mod=productgroupedit';" class="admin-button" />
      </form>      
    </td>
    <td>
      {include file='admin.my.button.delete.tpl'}      
    </td>
    <td>
      {include file='admin.my.control.sort.tpl'}
    </td>
    <td>
      {include file='admin.my.control.search.tpl'}
    </td>
  </tr>
</table>

<hr />
{if sizeof($res)!=0}

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th>&nbsp;</th>      
      <th>Termékcsoport neve</th>
      <th>Bruttó ár</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}	
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}

    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.title}</td>        
        <td class="{$tdClass}">{$row.finalprice} Ft</td>
        <td class="{$tdClass}"><input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=productgroupedit&id={$row.id}';" class="admin-button" /></td>
      </tr>    
    {/foreach}
  </table>
</form>
{else}
Nincsenek termékcsoportok feltöltve!
{/if}


<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>


{include file='admin.footer.tpl'}
