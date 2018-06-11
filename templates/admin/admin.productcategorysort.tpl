{include file='admin.header.tpl'}

<script type="text/javascript">
{literal}
function moveUp() {
  var sel = $('sort');
  var now = sel.selectedIndex;
  if (now > 0) {
    var oldValue = sel[now-1].value;
    var oldText = sel[now-1].text;
    var newValue = sel[now].value;
    var newText = sel[now].text;
    sel[now-1].value = newValue;
    sel[now-1].text = newText;
    sel[now].value = oldValue;
    sel[now].text = oldText;
    sel.selectedIndex = now-1;    
  }
}
{/literal}

{literal}
function moveDown() {
  var sel = $('sort');
  var now = sel.selectedIndex;
  if (now < {/literal}{$maxMenuItems}{literal}) {
    var oldValue = sel[now+1].value;
    var oldText = sel[now+1].text;
    var newValue = sel[now].value;
    var newText = sel[now].text;
    sel[now+1].value = newValue;
    sel[now+1].text = newText;
    sel[now].value = oldValue;
    sel[now].text = oldText;
    sel.selectedIndex = now+1;    
  }
}
{/literal}

{literal}
function post() {  
  var sel = $('sort');
  var toSend = '';
  for (i=0; i<sel.length; i++) {
    if (i != 0) { toSend += '|'; }
    toSend += sel[i].value;
  }    
  $('data').value = toSend;  
  $('f').submit();
}
{/literal}
</script>



<h3>Kategóriák sorrendjének szerkesztése</h3>

<form action="admin.php?mod=productcategorysort&i={$i}" method="post" id="f">

<select name="sort" size="30" style="width: 600px;" id="sort">  
  {foreach from=$tmp2 item=i key=k}
    <option value="{$k}">{$i}</option>
  {/foreach}
</select>

<table style="width: 600px;">
  <tr>
    <td>
      <input type="button" name="up" onClick="javascript:moveUp();" value="Fel" class="admin-button" />
    </td>
    <td>
      <input type="button" name="up" onClick="javascript:moveDown();" value="Le" class="admin-button" />
    </td>
    <td>
      <input type="button" name="sb" onClick="javascript:post();" value="Mentés" class="admin-button" />
    </td>
    <td>
      <input type="button" name="bk" onClick="javascript:document.location='admin.php?mod=productcategorylist';" value="Vissza" class="admin-button" />
    </td>    
  </tr>
</table>

<input type="hidden" name="data" value="" id="data" />
<input type="hidden" name="ispostback" value="true" />

</form>

{include file='admin.footer.tpl'}
