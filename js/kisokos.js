var betu;
betu="";

function showf(ujbetu)
{
if (betu!="")
{
    document.getElementById(betu).style.display="none";
}

    document.getElementById(ujbetu).style.display="block";
    betu=ujbetu;
    
}