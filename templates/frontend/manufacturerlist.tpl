{include file='header.tpl'}

<td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>

            <td class="pageHeading">Összes gyártó</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="images/pixel_trans.gif" border="0" alt="" width="100%" height="10"></td>
      </tr>
      <tr>

        <td class="main"><table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td class="t1"><img src="images/template/box/t1.png" border="0" alt="" width="17" height="28"></td>
    <td class="t2">Gyártók</td>
    <td class="t3" valign="middle"><img src="images/template/box/t3.png" border="0" alt="" width="17" height="28"></td>
  </tr>
</table>

<table border="0" width="100%" cellspacing="0" cellpadding="0" class="infoBoxSmall">
  <tr>
    <td><table border="0" width="100%" cellspacing="0" cellpadding="0"  class="infoBoxContents">
    <tr>
      <td class="m1"><img src="images/template/box/m1.png" border="0" alt="" width="17" height="1"></td>
      <td class="boxText">
      
      {assign var=lastLetter value=*}
      {assign var=cnt value=`0`}
          
      <table width="100%" class="boxText">
        <tr>
        
      {foreach from=$data item=row}
        {if $row.letter!=$lastLetter}
          </tr>
          <tr>
            <td colspan="3"><div style="font-size: 14px; font-weight: bold; margin-top: 10px; "><b>{$row.letter}</b></div></td>
          </tr>     
          {assign var=cnt value=`0`}
          <tr>
        {/if}
        
        <td><a href="{$row.filename}.html">{$row.title}</a></td>
              
        {assign var=lastLetter value=`$row.letter`}      
        {assign var=cnt value=`$cnt+1`}
        {if $cnt==3}
          </tr><tr>
          {assign var=cnt value=`0`}
        {/if}
        
        
      {/foreach}
        </tr>
      </table>
    </tr>
  <tr>
    <td  class="dl"><img src="images/template/box/d1.png" border="0" alt="" width="17" height="14"></td>
    <td  class="d2"><img src="images/template/box/d2.png" border="0" alt="" width="1" height="14"></td>
    <td  class="d3"><img src="images/template/box/d3.png" border="0" alt="" width="17" height="14"></td>
  </tr>
</table>

</td>
  </tr>

</table>

    
{include file='footer.tpl'}    
