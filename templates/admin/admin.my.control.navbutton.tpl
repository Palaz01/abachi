{literal}
<script>
  function admin_send_page (i) {
    $('newpage').value = i;
    $('pager_form').submit();
  }
</script>
{/literal}
<table cellpadding="5" cellspacing="5">
  <tr>
    <td style="width: 200px;">
      {if $prevbutton}
        <input type="button" name="pager_first" onclick="javascript:admin_send_page(0);" value="Első oldal" class="admin-button" />
        <input type="button" name="pager_prev" onclick="javascript:admin_send_page({$currentpage-2});" value="Előző oldal" class="admin-button" />
      {/if}
    </td>
    <td>
      {if $show_pager}
        {section name=i start=$pager_start loop=$pager_end+1 step=1}
          {if $smarty.section.i.index == $currentpage-1}
            <input type="button" name="pager_button_dummy" value="[{$smarty.section.i.index+1}]" disabled="true" class="admin-button" />
          {else}
            <input type="button" name="pager_button_{$smarty.section.i.index}" onclick="javascript:admin_send_page({$smarty.section.i.index});" value="{$smarty.section.i.index+1}" class="admin-button" />
          {/if}
        {/section}
      {/if}      
     </td>
     <td style="width: 250px;">
      {if $nextbutton}
        <input type="button" name="pager_next" onclick="javascript:admin_send_page({$currentpage});" value="Következő oldal" class="admin-button" />
        <input type="button" name="pager_last" onclick="javascript:admin_send_page({$maxpage-1});" value="Utolsó oldal" class="admin-button" />
      {/if}
    </td>
  </tr>
</table>   
<center><span>{$currentpage} / {$maxpage} oldalból</span></center> 
<form action="{$formaction}" method="post" id="pager_form">
{$hiddens}
<input type="hidden" name="newpage" id="newpage" value="" />
</form>
