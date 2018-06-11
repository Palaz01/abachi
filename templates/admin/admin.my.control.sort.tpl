  
  <form action="{$formaction}" method="post">
    Rendezés:         
    {$hiddens}
    <select name="sort_by" id="sortby" class="admin-select">
      {foreach from=$sortable item=string key=value}      
        <option value="{$value}">{$string}</option>      
      {/foreach}
    </select>
    <select name="sort_dir" id="sortdir" class="admin-select">
      <option value="0">Növekvő</option>
      <option value="1">Csökkenő</option>
    </select>
    <input type="submit" name="dosort" value="Rendezés" class="admin-button" />
  </form>

<script>
$('sortby').value = '{$orderby}';
$('sortdir').value = '{$orderdir}';
</script>

