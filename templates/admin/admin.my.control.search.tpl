<center>
{if $search === false}  
  {if count($searchable) != 0}
    <form action="{$formaction}" method="post">
      {$hiddens}
        Keresés: 
        <select name="search_where" class="admin-select">
        {foreach from=$searchable key=value item=string}        
          <option value="{$value}">{$string}</option>
        {/foreach}
      </select>
      <input type="textbox" name="search_str" class="admin-text" />
      <input type="submit" name="dosearch" value="Keresés" class="admin-button" />
    </form>

  {/if}
{else}

  <form action="{$formaction}" method="post">
    Keresés: { $search[0] } mezőben "{ $search[1] }"
    {$hiddens}    
    <input type="submit" name="clearsearch" value="Feltétel törlése" class="admin-button" />    
  </form>

{/if}
</center>
