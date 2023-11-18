window.addEventListener('turbo:load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor( inputValue/10 )
    console.log(addTaxDom.innerHTML)
    const addprofit = document.getElementById("profit")
    addprofit.innerHTML = Math.floor( inputValue - addTaxDom.innerHTML )
    console.log(addprofit.innerHTML)
  })


});


