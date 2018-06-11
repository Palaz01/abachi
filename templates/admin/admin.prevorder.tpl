{if sizeof($orderList)!=0}
<h3>Felhasználó eddigi megrendelései</h3>

<table border="1">
  <tr>
    <td>Dátum</td>
    <td>Összérték</td>
    <td>Státusz</td>
  </tr>
  {foreach from=$orderList item=row}
    <tr>
      <td>{$row.arrived}</td>
      <td>{$row.totalsum}</td>
      <td>{$row.statustxt}</td>
    </tr>
  {/foreach}
</table>
{/if}
