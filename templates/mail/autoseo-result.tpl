#AutoSEO (abachiszauna.hu)#
{if sizeof($mailUpdated)!=0}
<strong>Automatikus SEO eredménye - átírt mezők</strong>
<br />
<br />
<table border="1">
  <tr>
    <th>Tartalom / Link</th>
    <th>Mező</th>
    <th>Új érték</th>
  </tr>
  {foreach from=$mailUpdated key=metaid item=fields}
  {foreach from=$fields key=fieldname item=field}
    <tr>
      <td><a href="{$tableHelper[$metaid].url}" target="_blank" title="">{$tableHelper[$metaid].helpertitle}</a></td>
      <td>{$fieldname}</td>
      <td>{$field}</td>
    </tr>
  {/foreach}
  {/foreach}
</table>
{/if}
{if sizeof($mailProposed)!=0}
<br />
<br />
<strong>Automatikus SEO eredménye - javaslatok</strong> <span>(A javaslatok elfogadásához kérlek használd az adminisztrációs felületet!)</span>
<br />
<table border="1">
  <tr>
    <th>Tartalom / Link</th>
    <th>Mező</th>
    <th>Javasolt érték</th>
  </tr>
  {foreach from=$mailProposed key=metaid item=fields}
  {foreach from=$fields key=fieldname item=field}
    <tr>
      <td><a href="{$tableHelper[$metaid].url}" target="_blank" title="">{$tableHelper[$metaid].helpertitle}</a></td>
      <td>{$fieldname}</td>
      <td>{$field}</td>
    </tr>
  {/foreach}
  {/foreach}
</table>
{/if}