{if $showforceseo}

{assign var=autoseoToReplace value='edit'}
{assign var=autoseoButtontitle value='Automatikus SEO'}
{if isset($autoseoRedef)}{assign var=autoseoToReplace value=$autoseoRedef}{/if}
{if isset($autoseoButtoncaption)}{assign var=autoseoButtontitle value=$autoseoButtoncaption}{/if}

{literal}
<script type="text/javascript">
function admin_autoseo() {
  var boxes = Form.getInputs("form","checkbox");
  var ids=''; 
  var dojump=0;
  for (var i=0; i<boxes.length; i++) {
    if (boxes[i].checked) {
      var temp = boxes[i].id; 
      if (!temp) { continue; }
      arr = temp.split('-');
      if (arr.length!=2) { continue; }
      if (dojump != 0) {
        ids += ",";
      }
      ids += arr[1]; 
      dojump++;
    }
  }
  if (dojump > 0) {
    {/literal}
    var link = '{$formaction}';
    link = link.replace ('list', '{$autoseoToReplace}');
    {literal}    
    $('toautoseo').value = ids;
    $('autoseoform').submit();
      
  }  
  else {
    alert ('Egy elem sincs kijelölve!');
  }
  return false;
}
</script>
{/literal}
<form action="{$formaction}" method="post" id="autoseoform">
  <input type="button" name="autoseo" onclick="javascript: return admin_autoseo();" value="{$autoseoButtontitle}" class="admin-button" />
  {$hiddens}
  <input type="hidden" name="toautoseo" id="toautoseo" value="" />
  <input type="hidden" name="cmd" value="st_autoseo" />
</form>
{if isset($autoseomessageinserted)}
<script type="text/javascript">
alert ('Késleltetett AutoSEO beállítva.');
</script>
{/if}

{/if}