<form action="{$formaction}" method="post" id="sorterForm">
  {$hiddens}
  <input type="hidden" name="sort_by" id="sortby" />
  <input type="hidden" name="sort_dir" id="sortdir" />
</form>
{literal}
<script>
function sort(ob, od) {
  $('sortby').value = ob;
  $('sortdir').value = od;    
  $('sorterForm').submit();  
}
</script>
{/literal}
