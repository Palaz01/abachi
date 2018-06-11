{include file='admin.header.tpl'}

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<center>
<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td colspan="2">
      {include file='admin.my.button.autoseo.tpl'}
    </td>
  </tr>
  <tr>
    <td>
      <form>
        <input type="button" name="new_article" id="new_article" value="Új szolgáltatás" onclick="javascript: document.location='admin.php?mod=szolgaltatasedit';" class="admin-button" />
      </form>      
    </td>
    <td>
      {include file='admin.my.control.sort.tpl'}
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
  <tr>
    <td colspan="2">
      <center>        
        <form action="{$formaction}" method="post">
          {if $customsearch===false}
            Szabadszavas keresés:
            <input type="text" name="customsearch" value="{$customsearch}" />
            <input type="submit" name="docustomsearch" value="Szűkítés" class="admin-button" />
            {$hiddens}  
          {else}
            Szűkítés: <strong>{$customsearch}</strong>
            <input type="hidden" name="customsearch" value="" />
            <input type="submit" name="docustomsearch" value="Feltétel törlése" class="admin-button" />
            {$hiddens}
          {/if}
        </form>
      </center>
    </td>
  </tr>
</table>

<hr />
<input align="center" type="button" name="sorrendez" value="Sorrend szerkesztése" onclick="javascript: document.location='{$formaction}&do=rendez';" class="admin-button" />
<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>
      <th><input type="checkbox" name="changeall" onclick="javascript: changeAllCheckbox();"></th>            
      <th>Szolgálatatás</th>
      <th>Látható</th>
      <th>&nbsp;</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr>
        <td class="{$tdClass}"><input id="id-{$row.id}" type="checkbox" /></td>
        <td class="{$tdClass}">{$row.title}</td>        
        <td class="{$tdClass}" style="text-align:center">{if $row.public=="1"}Igen{else}Nem{/if}</td>
        <td class="{$tdClass}"><input type="button" name="view{$row.id}" value="Megtekintés" onclick="javascript: popUp('{$row.filename}{#ext#}');" class="admin-button" /></td>
        <td class="{$tdClass}"><input type="button" name="editproject{$row.id}" value="Szerkesztés" onclick="javascript: document.location='admin.php?mod=szolgaltatasedit&id={$row.id}';" class="admin-button" /></td>        
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
