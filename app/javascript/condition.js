function condition (){
  const TableRow = document.querySelectorAll(".condition-content");
  TableRow.forEach(function(row){
    const Td = row.querySelectorAll("td");

    const tmp = Td[2];
    const Tmp = tmp.getAttribute("data-tmp");
    if (Tmp > 37.5){
      tmp.setAttribute("style", "color: red;")
    }

    const fsi = Td[3];
    const Fsi = fsi.getAttribute("data-fsi");
    if (Fsi != 2){
      fsi.setAttribute("style", "color: red;");
    }

    const gsi = Td[4];
    const Gsi = gsi.getAttribute("data-gsi");
    if (Gsi != 2){
      gsi.setAttribute("style", "color: red;");
    }
  });
}
document.addEventListener("DOMContentLoaded", condition);