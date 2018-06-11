{include file='admin.header.tpl'}


{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

<form action="{$formAction}" method="post" enctype="multipart/form-data" onsubmit="javascript: populateHidden();">

<h3>Főoldalra kiemelt termékek</h3>

{include file='admin.my.productselector.tpl'}

<h3>Kiemelt gyártók</h3>

<select name="manufacturers[]" class="admin-select" multiple="multiple" size="10">
  {html_options options=$manufacturersOptions selected=$manufacturers}
</select>

<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Tárolás" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=productgrouplist';" /> &nbsp; &nbsp; &nbsp;
</div>

</form>

{include file='admin.footer.tpl'}
