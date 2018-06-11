{include file='admin.header.tpl'}

<table>
  <tr>
    <th style="text-align: left;">Megrendelés azonosító:</th>
    <td>{$orders.ordertextid}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Név:</th>
    <td>{$orders.lastname} {$orders.forename}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Cégnév:</th>
    <td>{$orders.company}</td>
  </tr>
  <tr>
    <th style="text-align: left;">E-mail cím:</th>
    <td><a href="mailto:{$orders.email}">{$orders.email}</a></td>
  </tr>
  <tr>
    <th style="text-align: left;">Telefonszám:</th>
    <td>{$orders.telephone}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Fax:</th>
    <td>{$orders.fax}</td>
  </tr>  
  <tr>
    <th style="text-align: left; vertical-align: top;">Számlázási címe:</th>
    <td>{$billingAddress}</td>
  </tr>
  <tr>
    <th style="text-align: left; vertical-align: top;">Szállítási cím:</th>
    <td>{$deliveryAddress}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Megrendelés időpontja:</th>
    <td>{$orders.arrived}</td>
  </tr>  
  <tr>
    <th style="text-align: left;">Fizetés módja:</th>
    <td>{$orders.paymentmode}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Házhozszállítás díja:</th>
    <td>{$orders.deliveryprice} Ft</td>
  </tr>
<tr>
    <th style="text-align: left;">Választott szállítás módja:</th>
    <td>{$orders.deliverymode}</td>
  </tr>
  <tr>
    <th style="text-align: left;">Megrendelés státusza:</th>
    <td>
    
      <form action="admin.php?mod=orderview&id={$orders.id}" method="post" name="statusupdater">
        <select class="admin-select" name="newstatus">
          {html_options options=$orderStatuses selected=$orders.status}
        </select>        
        <input type="submit" class="admin-button" name="statusupdate" value="Átállít" />  
      </form>
    
    </td>
  </tr>
</table>

<br />
<hr />
<br />

<table border="1">
	<tr>
		<th>
		  Termék neve
		</th>		
    <th>
		  Darabszám
		</th>		
		<th>
		  Bruttó egységár
		</th>
    <th>
      Áfa
    </th>
		<th>
		  Nettó érték
		</th>
		<th>
		  Adó érték
		</th>
    <th>
		  Összesen
		</th>
	</tr>
	    
  {foreach from=$orderedItem item=row}
  <tr>
    <td>
      <a href="admin.php?mod=productsedit&id={$row.productid}" target="_blank">{$row.productname}</a>
    </td>
    <td>
      {$row.quantity}
    </td>
    <td>
      {$row.price} Ft
    </td>
    <td>
      {$row.vat}%
    </td>
    <td>
      {$row.nesssum} Ft
    </td>
    <td>
      {$row.vatsum} Ft
    </td>
    <td>
      {$row.grosssum} Ft
    </td>    
  </tr>
  {/foreach}
  <tr>
    <td colspan="5">&nbsp;</td>
    <td>
      <b>Mindösszesen:</b>
    </td>
    <td>
      {$orders.totalsum+$orders.deliveryprice} Ft
    </td>
  </tr>
</table>

<br />

{include file='admin.prevorder.tpl'} 

<div style="text-align: center">
  <input type="button" class="admin-button" name="printbutton" value="Nyomtatás" onclick="javascript: window.print();" /> &nbsp; &nbsp; &nbsp;  
  <input type="button" class="admin-button" name="backbutton" value="Vissza" onclick="javascript: document.location = 'admin.php?mod=orderlist';" /> 
</div>

{if $showMsg==true}
<script tyep="text/javascript">
alert ('Státusz átállítva!');
</script>
{/if}

{include file='admin.footer.tpl'}
