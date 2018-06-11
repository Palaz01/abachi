{literal}
<script>
function admin_send_deleted() {
  var boxes = Form.getInputs("form","checkbox");
  var ids='';
  var dojump=0;  
  for (var i=0; i<boxes.length; i++) {
    if (boxes[i].checked) {
      var temp = boxes[i].id;
      arr = temp.split('-');
      if (arr.length!=2) { continue; }
      if (dojump == 1) {
        ids += ",";
      }
      ids += arr[1];
      dojump = 1;
    }
  }
  if (dojump == 1) {
    if (confirm("Biztosan törölni akar?")) {    
      $('todelete').value = ids;
      $('deleterform').submit();
      return true;
    }  
  }  
  else {
    alert ('Egy elem sincs kijelölve!');
  }
  return false;
}
</script>
{/literal}
<form action="{$formaction}" method="post">
  <input type="submit" name="delete" onclick="javascript:return admin_send_deleted();" value="Törlés" class="admin-button" />
  {$hiddens}
  <input type="hidden" name="id" id="todelete" value="" />
  <input type="hidden" name="cmd" value="st_delete" />
</form>
