{if sizeof($errors)!=0}
<p class="error">
{foreach from=$errors item=error}
  {$error}   
  <br /> 
{/foreach}
</p>
{/if}
